# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libasdcp-cth
pkgver=0.1.3
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop Sound & Picture Track File format."
arch=('i686' 'x86_64')
url="http://carlh.net/asdcplib"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs>=1.61.0')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}-${pkgver}.tar.bz2::http://carlh.net/downloads/libasdcp-cth/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0a5f37fd56b8a02e176a3a2c08aa261eee836c1fef6c5d21fda7de4f40dace58')
conflicts=('asdcplib')
provides=('libasdcp-cth')

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
