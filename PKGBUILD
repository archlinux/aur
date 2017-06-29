# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit
pkgver=15.1.1
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk')
makedepends=('git')
provides=('gambit')
conflicts=('gambit')
source=("https://sourceforge.net/projects/$pkgname/files/gambit15/$pkgver/$pkgname-$pkgver.tar.gz" ludecomp.diff)
md5sums=('db47a02f66644806dbd43f77dc41ebeb'
         '4086c9c74892440e00c9be7f8ace4bce')
options=('!makeflags')

build() {
  cd "$pkgname-$pkgver"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  CXX=g++-6.3 ./configure --prefix=/usr --disable-enumpoly
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
