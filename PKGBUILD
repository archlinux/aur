# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.4.4
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/libdcp"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'imagemagick' 'openjpeg2' 'libcxml>=0.15.1' 'libsigc++>=2.0' 'boost-libs>=1.61.0' 'libasdcp-cth>=0.1.2')
makedepends=('python2' 'boost>=1.60.0' 'python2' 'gcc' 'pkg-config')
source=("http://carlh.net/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2"  )
sha512sums=('589634eb56bc23437752a9b32e849332cd8e0f04991c63f583ce06ab7343f02226bc1e2faead13edba2dab9bca86c89adaf83df7779c427f167e461c2d6dabbd')

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

