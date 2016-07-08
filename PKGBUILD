# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libasdcp-cth
pkgver=0.1.2
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop Sound & Picture Track File format."
arch=('i686' 'x86_64')
url="http://carlh.net/asdcplib"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}-${pkgver}.tar.bz2::http://carlh.net/downloads/asdcplib-cth/${pkgname}-${pkgver}.tar.bz2")
#http://carlh.net/downloads/libcxml/libcxml-0.12.0.tar.bz2o
#http://carlh.net/downloads/asdcplib-cth/libasdcp-cth-0.1.0.tar.bz2
sha256sums=('062d435a767091df30614a1252a81323c097027a9d01e067b2326f76c3ffc3da')
conflicts=('asdcplib')
provides=('asdcplib')

build() {
    CXXFLAGS="$CXXFLAGS -std=c++11"
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 waf configure --prefix=/usr
    python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64  ]
  then
      mv usr/lib64 usr/lib
  fi
}
