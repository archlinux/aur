# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=rexdep
pkgver=0.0.4
pkgrel=1
pkgdesc="Roughly extract dependency relation from source code"
arch=('i686' 'x86_64')
makedepends=('gcc' 'git' 'go' 'make' 'mercurial')
url="https://github.com/itchyny/rexdep"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/itchyny/$pkgname/tar.gz/v$pkgver)
sha256sums=('fa823a0d30d5db697afe4fde34ad18813200bc861b47e92b41c88224ce7d6b98')
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
