# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit
pkgver=14.1.1
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk')
makedepends=('git')
provides=('gambit')
conflicts=('gambit')
source=(https://github.com/gambitproject/gambit/archive/v$pkgver.tar.gz ludecomp.diff)
md5sums=('da5e1b4690b028a3d6cb8a8c27bc7725'
         '4086c9c74892440e00c9be7f8ace4bce')
options=('!makeflags')

build() {
  cd "$pkgname-$pkgver"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  ./configure --prefix=/usr --disable-enumpoly
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
