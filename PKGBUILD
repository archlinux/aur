# Maintainer:  Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.14.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('elfutils')
makedepends=('ocaml')
url="http://flowtype.org"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('1dab6ca03966e9ddc0a22220b56df55997e9ec26bdc795ca4ba7db9b1c76a376')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Checking...'
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership bin/examples/examples "$pkgdir/usr/share/doc/$pkgname"

  msg 'Installing...'
  install -Dm 755 bin/flow "$pkgdir/usr/bin/flow"
}
