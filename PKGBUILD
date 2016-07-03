# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp-git
pkgver=0.r863.b691a2b
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libdcp"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg' 'libcxml>=0.12.0' 'libsigc++>=2.0' 'boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
provides=('libdcp')
conflicts=('libdcp')
source=("libdcp-git::git+http://git.carlh.net/git/libdcp.git")
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

         
