# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.6.6
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/libdcp"
license=('GPL')
depends=('openssl' 'libxml++2.6' 'xmlsec' 'imagemagick' 'openjpeg2' 'libcxml>=0.16.1' 'libsigc++>=2.0' 'boost-libs>=1.66.0' 'libasdcp-cth>=0.1.3')
makedepends=('python2' 'boost>=1.66.0' 'python2' 'gcc' 'pkg-config')
source=("http://carlh.net/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2"  )
sha512sums=('624d250268aa247658b4e5b89522fc1af79f7b8f70a68fbd01f4e0afd611b9ac3aa8054eb63c366967e8fb4d76c3beae5929b966c8f45da8cef01bc9d1585f77')

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
