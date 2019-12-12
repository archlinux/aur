# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.4.14
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="https://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++2.6' 'xmlsec'   'libdcp>=1.6.13' 'libcxml>=0.16.1' 'libsigc++>=2.0' 'boost-libs>=1.66.0' 'libasdcp-cth>=0.1.3')
makedepends=('python2' 'boost>=1.66.0')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}.tar.bz2::https://carlh.net/downloads/libsub/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('57dce55295bdaeaa1b237469771b7269e10eda920e4b8ccb0e953f076d92b46d5591ef11bb793542427cf24f40732283ac77b13d1eb4cd69b59470af37a20b8f')


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
