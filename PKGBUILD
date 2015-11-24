# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-git
pkgver=15.0.0.r15.g0860191
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
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gambit"
  git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

build() {
  cd "$srcdir/gambit"
  aclocal
  libtoolize
  automake --add-missing
  autoconf

  ./configure  --prefix=/usr 
  make 
}

package() {
  cd "$srcdir/gambit"
  make DESTDIR="$pkgdir/" install
}
