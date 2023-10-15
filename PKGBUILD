# Maintainer: Adam Maroti <jmarotiadam@gmail.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-espresso
pkgver=9
pkgrel=1
pkgdesc="Prevent auto suspend and screensaver functions (forked from caffeine)"
arch=('any')
url="https://github.com/coadmunkee/gnome-shell-extension-espresso.git"
install=espresso.install
license=('GPL2')
depends=('gnome-shell>=1:45.0-1')
makedepends=('unzip')
source=("${pkgname}::https://github.com/coadmunkee/gnome-shell-extension-espresso/archive/refs/tags/v${pkgver}.zip")
sha256sums=('d4cdbc4a856c73770b3df029dc6ea0bc8c22d6abf2e57c3c1c96b370f616e097')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./update-locale.sh

    glib-compile-schemas \
        --targetdir=espresso@coadmunkee.github.com/schemas/ \
        --strict espresso@coadmunkee.github.com/schemas
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
    cp -a "espresso@coadmunkee.github.com" "${pkgdir}/usr/share/gnome-shell/extensions"
}
