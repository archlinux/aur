# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=libuavcan
pkgver=1.0.0
pkgdesc="Portable reference implementation of the UAVCAN protocal stack in C++
for embedded systems and Linux."
url='https://uavcan.org'
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')
makedepends=('cmake')
depends=('python-pyuavcan=0.1')
options=(!staticlibs strip)
source=("${pkgname}-${pkgver}::https://github.com/UAVCAN/libuavcan/archive/v${pkgver}rc-last.tar.gz"
        "dsdl::https://github.com/UAVCAN/public_regulated_data_types/archive/192295c4f9b67f4a20b0eabf74757b6597415f2b.tar.gz")
sha256sums=('c32094fbe406a51c077c3be756d97ab6869c392030b69c54ac23ef845fee3d0d'
            '75217b3eeb2b2adad534359388842b8c02f469b7be24d7b00f11b2a4e214c78b')

_pkgver=${pkgver}rc-last

prepare() {
    cd "$srcdir"
    mv -n public_regulated_data_types-192295c4f9b67f4a20b0eabf74757b6597415f2b/* \
          "${pkgname}-${_pkgver}/dsdl"
}

build() {
  mkdir -p ${srcdir}/${pkgname}-${_pkgver}/build
  cd ${srcdir}/${pkgname}-${_pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
