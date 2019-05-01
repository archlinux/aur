# Maintainer: Mao Wtm <m@maowtm.org>
pkgname=misspell
pkgver=v0.3.4
pkgver() {
  cd "$pkgname-src"
  git describe | cut -d- -f1
}
pkgrel=1
pkgdesc="Correct commonly misspelled English words in source files"
arch=(any)
url="https://github.com/client9/misspell/"
license=('MIT')
makedepends=('go')
source=("$pkgname-src::git+https://github.com/client9/misspell.git#tag=$pkgver")
sha256sums=("SKIP")

build() {
  mkdir -p go/src/github.com/client9/
  cp -r $pkgname-src go/src/github.com/client9/$pkgname
  cd go
  export GOPATH=$(pwd)
  cd src/github.com/client9/$pkgname
  go get -v
  make install
}

package() {
  install -s -DT go/bin/misspell $pkgdir/usr/bin/misspell
}

