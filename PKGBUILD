# Maintainer: Mao Wtm <m@maowtm.org>
pkgname=ts-player
pkgver=1.1
pkgrel=1
pkgdesc="A terminal recorder that produces files capable of efficient random access"
arch=(x86_64)
url="https://github.com/micromaomao/ts-player"
license=('MIT')
makedepends=('go')
source=("$pkgname-src::git+https://github.com/micromaomao/ts-player.git")
sha256sums=("SKIP")

build() {
  mkdir -p go/src/github.com/micromaomao/
  cp -r $pkgname-src go/src/github.com/micromaomao/$pkgname
  cd go
  export GOPATH=$(pwd)
  cd src/github.com/micromaomao/$pkgname
  make its.pb.go
  go get -v
  make
  go install
}

package() {
  install -s -DT go/bin/ts-player $pkgdir/usr/bin/ts-player
  install -DT go/src/github.com/micromaomao/ts-player/doc/ts-player.1 $pkgdir/usr/share/man/man1/ts-player.1
}

