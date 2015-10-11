# Maintainer:  Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.17.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('elfutils')
makedepends=('ocaml')
url="http://flowtype.org"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('282ead8e8a344e44b825b2f8727520fb420e79f76ed1c26fa3a137c8a0172b35')

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
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/$pkgname"

  msg 'Installing...'
  install -Dm 755 bin/flow "$pkgdir/usr/bin/flow"
}
