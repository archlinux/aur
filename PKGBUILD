# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qtextpad
pkgdesc="Lightweight cross-platform text editor using KF5's syntax highlighting repository."
pkgver=1.9
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/qtextpad'
license=('GPL3')
depends=('syntax-highlighting')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        force_qt5.patch)
sha256sums=('7906f15916070a08b69b851806d930730514fbcdbb02bbbf2f3ca9886fc008c9'
            'e0e837bf92fcc23d6c93b70e25eaed35e88a4c3dbe87b848e1a13dcfcf8f9855')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # KSyntaxHighlighting only supports Qt5 in Arch for now...
    patch -p1 -i "${srcdir}/force_qt5.patch"
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
