pkgname=hotshots-git
pkgver=r19.e3712ae1
pkgrel=1
pkgdesc="Screenshot and annotation software"
arch=('x86_64')
url="https://github.com/obiwankennedy/HotShots"
license=('GPL2')
depends=('qt5-x11extras' 'qt5-multimedia' 'shared-mime-info')
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
    qmake -recursive  HotShots.pro \
        INSTALL_PREFIX=/usr \
        INSTALL_LIBDIR=INSTALL_PREFIX/lib
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="$pkgdir" install

    install -Dm644 packaging/flatpak/HotShots.metainfo.xml \
        "$pkgdir/usr/share/mime/packages/${pkgname%-git}.xml"
}