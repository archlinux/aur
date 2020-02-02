# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.4.18
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="https://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++2.6' 'xmlsec'   'libdcp>=1.6.13' 'libcxml>=0.16.1' 'libsigc++>=2.0' 'boost-libs>=1.72.0' 'libasdcp-cth>=0.1.3')
makedepends=('python2' 'boost>=1.72.0')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}.tar.bz2::https://carlh.net/downloads/libsub/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('4baeaa2f910ad60c3e5fc62c5df42e253c7afc40f4b3df5e67e2db9412d57ab6d5b694f1fb7fc1e161ffcbf7fa89b44f253c1ab908bc9c450009d010e83c3b58')


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
