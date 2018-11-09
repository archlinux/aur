# Maintainer: Mao Wtm <m@maowtm.org>
pkgname=go-ecbpass
pkgver=1.01
pkgrel=1
pkgdesc="A tool to generate pseudorandom, deterministic passwords."
arch=(x86_64)
url="https://github.com/micromaomao/go-ecbpass"
license=('MIT')
makedepends=('go'  'asciidoc'  'docbook2x')
source=("$pkgname-src::git+https://github.com/micromaomao/go-ecbpass.git")
sha256sums=("SKIP")

build() {
  mkdir -p go/src/github.com/micromaomao/
  cp -r $pkgname-src go/src/github.com/micromaomao/$pkgname
  cd go
  export GOPATH=$(pwd)
  cd src/github.com/micromaomao/$pkgname
  go get -v
  go install
  cd doc
  make
  cd $GOPATH/..
}

package() {
  install -s -DT go/bin/go-ecbpass $pkgdir/usr/bin/go-ecbpass
  install -DT go/src/github.com/micromaomao/go-ecbpass/doc/go-ecbpass.1 $pkgdir/usr/share/man/man1/go-ecbpass.1
}

