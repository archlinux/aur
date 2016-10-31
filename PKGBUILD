# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp-git
pkgver=0.r1470.2429e8c
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libdcp"
license=('GPL')
depends=('libcxml>=0.15.1' 'openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg'  'libsigc++>=2.0' 'boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
provides=('libdcp')
conflicts=('libdcp')
source=("libdcp-git::git+https://github.com/cth103/libdcp.git#branch=1.0")
sha512sums=('SKIP')

pkgver() {
  cd libdcp-git
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  CXXFLAGS="$CXXFLAGS -std=c++11"
    cd libdcp-git
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
    cd libdcp-git
  python2 waf install --destdir=$pkgdir
}
