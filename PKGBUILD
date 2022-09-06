# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.6.28
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="https://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++2.6' 'xmlsec' 'libdcp>=1.8.25' 'libasdcp-cth>=0.1.6.r18.ga276ed1' 'libsigc++>=2.0' 'boost-libs>=1.72.0')
makedepends=('python' 'boost>=1.72.0')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}.tar.bz2::https://carlh.net/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('545182e7c04e1cbaedfe534adec487365e0888ff6a08d2d16c81eabdf28f7917')

build() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python waf configure --prefix=/usr --disable-tests
  python waf build
}

package() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
