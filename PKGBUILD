# Contributor: Dylon Edwards <deltaecho at archlinux dot us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='tetgen'
pkgver='1.5.1'
pkgrel=1
pkgdesc='A Quality Tetrahedral Mesh Generator and a 3D Delaunay Triangulator'
arch=('x86_64')
url='http://wias-berlin.de/software/index.jsp?id=TetGen&lang=1'
license=('AGPL3')
# You must accept the licensing terms before downloading the source archive:
#   http://wias-berlin.de/software/tetgen/download2.jsp
# Place the downloaded archive in $SRCDEST of your /etc/makepkg.conf
source=("local://${pkgname}${pkgver}.tar.gz")
sha256sums=('e46a4434a3e7c00044c8f4f167e18b6f4a85be7d22838c8f948ce8cc8c01b850')
options=('staticlibs')

build() {
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  cmake ../"${pkgname}${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  install -m 755 -D -t "${pkgdir}/usr/bin" tetgen
  install -m 644 -D -t "${pkgdir}/usr/lib" libtet.a
  install -m 644 -D -t "${pkgdir}/usr/include" ../"${pkgname}${pkgver}/tetgen.h"
}
