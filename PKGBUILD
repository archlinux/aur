# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp-git
pkgver=0.r1633.a602723
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libdcp"
license=('GPL')
depends=('libcxml-git' 'libsndfile' 'openssl' 'libxml++>=2.6' 'xmlsec' 'imagemagick' 'openjpeg2' 'libsigc++>=2.0' 'boost-libs>=1.61.0' 'libasdcp-cth')
makedepends=('python2' 'boost>=1.45' 'pkg-config')
provides=('libdcp=1.4.3devel')
conflicts=('libdcp')
source=("libdcp-git::git://git.carlh.net/git/libdcp.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd libdcp-git
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export PKG_CONFIG_LIBDIR="/usr/lib64/pkgconfig/:/usr/lib/pkgconfig/:$PKG_CONFIG_LIBDIR"
  export CXXFLAGS="$CXXFLAGS -std=c++11"
  cd libdcp-git
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd libdcp-git
  python2 waf install --destdir=$pkgdir
}
