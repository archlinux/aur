# Maintainer: Francois Menning <f.menning@pm.me>
# Contributer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-espresso
pkgver=7
pkgrel=1
pkgdesc="Prevent auto suspend and screensaver functions (forked from caffeine)"
arch=('any')
url="https://github.com/coadmunkee/gnome-shell-extension-espresso.git"
install=espresso.install
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    ./update-locale.sh

    glib-compile-schemas \
        --targetdir=espresso@coadmunkee.github.com/schemas/ \
        --strict espresso@coadmunkee.github.com/schemas
}

package() {
    cd "${srcdir}/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
    cp -a "espresso@coadmunkee.github.com" "${pkgdir}/usr/share/gnome-shell/extensions"
}
