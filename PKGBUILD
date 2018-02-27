# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=liblocked-sstream-git
pkgver=0.r16.24b1e92
pkgrel=1
pkgdesc="library for dcpomatic sstream locking"
arch=('i686' 'x86_64')
url="http://carlh.net/locked_sstream"
license=('GPL')
depends=('boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
provides=('liblocked-sstream-git')
conflicts=('liblocked-sstream')
source=("liblocked-sstream-git::git://git.carlh.net/git/locked_sstream.git")
sha512sums=('SKIP')

pkgver() {
  cd liblocked-sstream-git
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    CXXFLAGS="$CXXFLAGS    -std=c++11"
    cd liblocked-sstream-git
    python2 waf configure --prefix=/usr
    python2 waf build
}

package() {
    cd liblocked-sstream-git
  python2 waf install --destdir=$pkgdir
}
