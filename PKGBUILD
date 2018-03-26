# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub-git
pkgver=0.r427.ff0eb53
pkgrel=1
pkgdesc="libsub is a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="http://carlh.net/libsub"
license=('GPL')
depends=('libdcp-git'  'liblocked-sstream-git' 'libcxml-git' 'openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg'  'libsigc++>=2.0' 'boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
provides=('libsub')
conflicts=('libsub')
source=("libsub-git::git://git.carlh.net/git/libsub.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd libsub-git
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    CXXFLAGS="$CXXFLAGS    -std=c++11"
    cd libsub-git
    python2 waf configure --prefix=/usr --enable-debug
    python2 waf build
}

package() {
    cd libsub-git
  python2 waf install --destdir=$pkgdir
}
