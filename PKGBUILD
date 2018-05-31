# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml-git
pkgver=0.r130.a45e430
pkgrel=1
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/libcxml"
license=('GPL')
depends=('liblocked-sstream-git' 'libxml++2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
provides=('libcxml')
conflicts=('libcxml')
source=("libcxml::git+https://github.com/cth103/libcxml.git")
sha256sums=('SKIP')

pkgver() {
    cd libcxml
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export CXXFLAGS="$CXXFLAGS -std=c++11"
    export PKG_CONFIG_LIBDIR="/usr/lib64/pkgconfig/:/usr/lib/pkgconfig/:$PKG_CONFIG_LIBDIR"
    cd libcxml
    python2 waf configure --prefix=/usr
    python2 waf build
}

package() {
    cd libcxml
    python2 waf install --destdir=$pkgdir
}
