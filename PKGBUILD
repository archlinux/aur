# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgname='tetgen'
pkgver='1.5.0'
pkgrel=1
pkgdesc='A Quality Tetrahedral Mesh Generator and a 3D Delaunay Triangulator'
arch=('x86_64')
url='http://wias-berlin.de/software/index.jsp?id=TetGen&lang=1'
license=('AGPL3')
changelog="${pkgname}.changelog"
# You must accept the licensing terms before downloading the source archive:
#   http://wias-berlin.de/software/tetgen/download2.jsp
# Place the downloaded archive in $SRCDEST of your /etc/makepkg.conf
source=("local://${pkgname}${pkgver}.tar.gz")
md5sums=('3b9fd9cdec121e52527b0308f7aad5c1')

prepare() {
    mkdir -p build
}

build() {
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
