# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=goproxy
pkgver=6.0
pkgrel=1
pkgdesc="A high performance HTTP, HTTPS, websocket, TCP, UDP, Secure DNS, Socks5 proxy server"
arch=('x86_64')
url="https://github.com/snail007/goproxy"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/snail007/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go' 'dep' 'git')

_importpath="github.com/snail007/$pkgname"

prepare() {
  export GOPATH="$srcdir/_go"
  mkdir -p $(dirname "$GOPATH/src/$_importpath")
  ln -sf "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_importpath"
  cd "$GOPATH/src/$_importpath"
  dep ensure -v
}

check() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath"
  go test $(go list ./...)
}

build() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath"
  go build
}

package() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('a2c9200cdfbd73b55a1cf0f80fe401a09e5d1488b45edc84ebc95d95783c3115')
