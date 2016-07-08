# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.1.13
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="http://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec'   'libdcp>=1.3.4' 'libcxml>=0.15.1' 'libsigc++>=2.0' 'boost-libs>=1.60.0' 'libasdcp-cth')
makedepends=('python2' 'boost>=1.60.0')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}.tar.bz2::http://carlh.net/downloads/libsub/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('85785ce69e52ce8d5746a9cf15178a9e98d13f63a4c899d13ff5df40ab871fd8ddbea0261b7e01ab9220973c0f9b6f0faeefe94c7f0755eaf43ae2674c367ea6')


build() {
  CXXFLAGS="$CXXFLAGS -std=c++11"
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr 
  python2 waf build
}

package() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}

         
