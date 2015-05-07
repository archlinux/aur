# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=havm
pkgname=${_pkgname}-git
pkgver=0.26.7.gb493ecf
pkgrel=3
pkgdesc='HAVM is a Tree intermediate language interpreter.'
url='https://www.lrde.epita.fr/wiki/Havm'
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git' 'ghc')
depends=('libffi' 'gmp')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.lrde.epita.fr/tiger/$_pkgname.git"
        '001-fix_ghc_7.10.patch')
md5sums=('SKIP'
         '0827bcd8df2d8941120cf7a46ffb48ab')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|havm-||;s|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np0 < ../001-fix_ghc_7.10.patch
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
