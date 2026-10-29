# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=fatrat
pkgver=1.3.1
pkgrel=1
pkgdesc="Qt Download/Upload Manager"
arch=('i686' 'x86_64' 'aarch64')
url='https://fatrat.dolezel.info'
license=('GPL-3.0-only')
depends=('qt6-svg' 'qt6-tools' 'pybind11' 'libtorrent-rasterbar')
optdepends=('desktop-file-utils: add application to MIME database')
makedepends=('cmake' 'npm' 'boost')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lubosd/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5604f1523361f9a7f3e65b4bb61762f2206e9ce8d1c1c302da99cfc6602b4710')

build() {
    rm -Rf build && mkdir build
    cd build
    cmake ../${pkgname}-${pkgver} \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DWITH_EVERYTHING=ON
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    install -D -m644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE \
      -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
