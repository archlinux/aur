# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-git
pkgver=15.1.0.r39.g3f06914
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk')
makedepends=('git')
provides=('gambit')
conflicts=('gambit')
source=(git+https://github.com/gambitproject/gambit.git)
options=('!makeflags')
md5sums=('SKIP')

pkgver() {
  cd "gambit"
  git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

build() {
  cd "gambit"
  aclocal
  libtoolize
  automake --add-missing
  autoconf

  CXXFLAGS+=" -std=c++03" ./configure --prefix=/usr --disable-enumpoly
  make 
}

package() {
  cd "gambit"
  make DESTDIR="$pkgdir/" install
}
