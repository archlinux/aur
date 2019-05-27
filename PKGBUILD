# Maintainer: zartak <cyril@cri.epita.fr>

_pkgname=havm
pkgname=${_pkgname}-epita
pkgver=0.28
pkgrel=1
pkgdesc='HAVM is a Tree intermediate language interpreter.'
url='https://www.lrde.epita.fr/wiki/Havm'
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git' 'ghc' 'ghc-static')
depends=('libffi' 'gmp')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.lrde.epita.fr/tiger/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|havm-||;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

check() {
  cd "$srcdir/$_pkgname"
  make check
}

# vim:set sts=2 sw=2 et:
