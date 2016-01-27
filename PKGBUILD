# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=rexdep
pkgver=0.0.5
pkgrel=1
pkgdesc="Roughly extract dependency relation from source code"
arch=('i686' 'x86_64')
makedepends=('gcc' 'git' 'go' 'make' 'mercurial')
url="https://github.com/itchyny/rexdep"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/itchyny/$pkgname/tar.gz/v$pkgver)
sha256sums=('17f477c510aa8c7f2cbc221ce858b238300da39b8c30153d82190efb5a272d0a')
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
