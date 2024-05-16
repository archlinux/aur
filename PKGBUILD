# Maintainer: Adam Maroti <jmarotiadam@gmail.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-espresso
pkgver=10
pkgrel=1
pkgdesc="Prevent auto suspend and screensaver functions (forked from caffeine)"
arch=('any')
url="https://github.com/coadmunkee/gnome-shell-extension-espresso.git"
install=espresso.install
license=('GPL2')
depends=('gnome-shell>=1:46.0-1')
makedepends=('unzip')
source=("${pkgname}::https://github.com/coadmunkee/gnome-shell-extension-espresso/archive/refs/tags/v${pkgver}.zip")
sha256sums=('9ec17149b79669185b76b0ec166755671f1d58f0b57acdaaf6f07fde6f37c6b2')

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
