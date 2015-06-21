# Maintainer:  Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flow
pkgver=0.12.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('i686' 'x86_64')
depends=('elfutils')
makedepends=('ocaml')
url="http://flowtype.org"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('3bf2e97df59d7aaa941f1ac920965a52976971f8416338456785431888c13c0f')

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
