# Contributor: Dylon Edwards <deltaecho at archlinux dot us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: haawda
# Maintainer: eDgar <edgar `not@` openmail cc>

pkgname=tetgen
pkgver=1.6.0
pkgrel=4
pkgdesc='A Quality Tetrahedral Mesh Generator and a 3D Delaunay Triangulator'
arch=('x86_64')
url='http://wias-berlin.de/software/index.jsp?id=TetGen&lang=1'
license=('AGPL3')
#  You must accept the licensing terms before downloading the source archive:
#    http://wias-berlin.de/software/tetgen/download2.jsp
#  Place the downloaded archive in $SRCDEST of your /etc/makepkg.conf
source=("${pkgname}${pkgver}.tar.gz")
sha256sums=('87b5e61ebd3a471fc4f2cdd7124c2b11dd6639f4feb1f941a5d2f5110d05ce39')
options=('staticlibs')
makedepends=('cmake')

[ ! -f ${pkgname}${pkgver}.tar.gz ] &&
  printf "1. Visit http://wias-berlin.de/software/tetgen/download2.jsp\n" &&
  printf "2. Place the downloaded tar.gz in \$SRCDEST (/etc/makepkg.conf;\n" &&
  printf "   right now SRCDEST=$SRCDEST)\n" &&
  printf "3. When ready, try again.\n" && exit

build() {
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  cmake ../"${pkgname}${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_FLAGS_RELEASE="-fPIC"
  make
}

package() {
  cd build
  install -m 755 -D -t "${pkgdir}/usr/bin" tetgen
  install -m 644 -D -t "${pkgdir}/usr/lib" libtet.a
  install -m 644 -D -t "${pkgdir}/usr/include" ../"${pkgname}${pkgver}/tetgen.h"
}
