# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.6.7
pkgrel=2
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="https://carlh.net/libdcp"
license=('GPL')
depends=('openssl' 'libxml++2.6' 'xmlsec' 'imagemagick' 'openjpeg2' 'libcxml>=0.16.1' 'libsigc++>=2.0' 'boost-libs>=1.66.0' 'libasdcp-cth>=0.1.3')
makedepends=('python2' 'boost>=1.66.0' 'python2' 'gcc' 'pkg-config')
source=("https://carlh.net/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2"  )
sha512sums=('24ae3855906168b5fe0981a6b6cd1f689ab7e76d95d13af79b15d19777ffb4259d3ca37ee2181ce3988a1c6a4231a3341c615f781cfb8151c5cfed573f0576d3')

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
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
