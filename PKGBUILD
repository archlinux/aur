# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: Alastair Pharo  asppsa at gmail dot com

pkgname=pure-reduce
pkgver=0.4
pkgrel=1
pkgdesc="Computer Algebra with Pure: A Reduce Interface"
arch=("i686" "x86_64")
license=('BSD' 'LGPL')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=()
groups=(pure-complete pure-math)
_reduce_rev=2204
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz"
        "https://bitbucket.org/purelang/pure-lang/downloads/reduce-algebra-csl-r$_reduce_rev.tar.bz2")
md5sums=('403aecde59914857c7b5ffb5e1edb1de'
         'dafc1f135921aa7f161fb2ff45675e65')

build() {
  cd $srcdir/$pkgname-$pkgver
  ln -sf $srcdir/reduce-algebra .
  make -j1 || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp "$srcdir/reduce-algebra/README" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Reduce"
}

# vim:set ts=2 sw=2 et:
