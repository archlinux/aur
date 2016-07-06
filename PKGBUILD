# -*- shell-script -*-
# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=pure-reduce-git
pkgver=r5646.3811e20
pkgrel=1
pkgdesc="Computer Algebra with Pure: A Reduce Interface"
arch=("i686" "x86_64")
license=('BSD' 'LGPL')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=('git')
provides=('pure-reduce')
conflicts=('pure-reduce')
replaces=('pure-reduce-hg')
_reduce_rev=2204
source=("git+https://bitbucket.org/purelang/pure-lang"
        "https://bitbucket.org/purelang/pure-lang/downloads/reduce-algebra-csl-r$_reduce_rev.tar.bz2")
md5sums=(SKIP 'dafc1f135921aa7f161fb2ff45675e65')

pkgver() {
  cd $srcdir/pure-lang
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/pure-lang/pure-reduce
  ln -sf $srcdir/reduce-algebra .
  make -j1 || return 1
}

package() {
  cd $srcdir/pure-lang/pure-reduce
  make DESTDIR=$pkgdir install || return 1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/pure-lang/pure-reduce/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp "$srcdir/reduce-algebra/README" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Reduce"
}

# vim:set ts=2 sw=2 et:
