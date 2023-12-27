# Maintainer: Andrey Rodionov <roand at inbox dot ru>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=hotshots-git
pkgver=r19.e3712ae
pkgrel=4
pkgdesc="Screenshot and annotation software"
arch=('x86_64')
url="https://github.com/obiwankennedy/HotShots"
license=('GPL2')
depends=('qt5-x11extras' 'qt5-multimedia')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/obiwankennedy/HotShots.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    qmake-qt5 -recursive  HotShots.pro \
        INSTALL_PREFIX=/usr \
        INSTALL_LIBDIR=INSTALL_PREFIX/lib
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="$pkgdir" install

    install -Dm644 packaging/flatpak/HotShots.metainfo.xml -t \
        "$pkgdir/usr/share/metainfo/"
}
