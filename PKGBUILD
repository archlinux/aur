# Maintainer: Nadir Boussoukaia <nad4reg at gmail dot com>
pkgname=hotshots-updated-git
pkgver=r33.9a67f69
pkgrel=1
pkgdesc="A HotShots fork mainly focused on using the editor standalone"
arch=('x86_64')
url="https://github.com/boussou/HotShots"
license=('GPL-2.0-or-later')
depends=('qt5-x11extras' 'qt5-multimedia')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/boussou/HotShots.git")
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
sha256sums=('SKIP')
