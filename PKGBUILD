# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-git
pkgver=16.0.1
pkgrel=2
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk')
makedepends=('git' 'gcc63')
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
  
  CXXFLAGS+=" -std=c++11" CXX=gcc-6.3 ./configure --prefix=/usr --disable-enumpoly
  make LANG=C
}

package() {
  cd "gambit"
  make DESTDIR="$pkgdir/" install
}
