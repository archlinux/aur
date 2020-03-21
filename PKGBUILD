# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=golang-github-gorilla-websocket
pkgver=1.4.2
pkgrel=1
pkgdesc='A fast, well-tested and widely used WebSocket implementation for Go'
arch=('any')
url="https://github.com/gorilla/websocket"
license=('BSD')
depends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('91937a36bc9e0da3c895c73d4cb74b2cdb1aff54ab21b0d0724000e7b5b85b84')

check() {
  export GOPATH="$srcdir/gopath:/usr/share/gocode"
  mkdir -p gopath/src/github.com/gorilla
  cp -a websocket-$pkgver gopath/src/github.com/gorilla/websocket
  cd gopath/src/github.com/gorilla/websocket
  go test -v $(go list ./...)
}

package() {
  mkdir -p "$pkgdir/usr/share/gocode/src/github.com/gorilla"
  cp -a websocket-$pkgver "$pkgdir/usr/share/gocode/src/github.com/gorilla/websocket"

  install -Dm644 websocket-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
