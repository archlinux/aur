# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qtextpad
pkgdesc="Lightweight cross-platform text editor using KF6's syntax highlighting repository."
pkgver=1.11
pkgrel=2
arch=('i686' 'x86_64')
url='https://github.com/zrax/qtextpad'
license=('GPL3')
depends=('syntax-highlighting')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "qt6.7_compat.patch")
sha256sums=('8257ba89f954811808d7a9b951a5456e201f907df3dbc4067d2584cfcabd168f'
            '18e1d868958c4315c957283434e4564b90bc3c884de6a4c55f037aba6db4767c')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "$srcdir"/qt6.7_compat.patch
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DQT_VERSION_MAJOR=6 \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
