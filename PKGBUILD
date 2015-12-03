# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=rexdep
pkgver=0.0.3
pkgrel=1
pkgdesc="Roughly extract dependency relation from source code"
arch=('i686' 'x86_64')
makedepends=('gcc' 'git' 'go' 'make')
url="https://github.com/itchyny/rexdep"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/itchyny/$pkgname/tar.gz/v$pkgver)
sha256sums=('a7726a7521401917b3457f851d7774365d0866f3399b1b9d3320f195b6162f8e')
options=('!strip' '!emptydirs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  export GOPATH="$srcdir"
  export TMPDIR=/tmp
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -Dm 755 "build/rexdep" -t "$pkgdir/usr/bin"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
