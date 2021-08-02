# Maintainer: Rainu <mqtt-shell@raysha.de>
pkgname=mqtt-shell
pkgver=2.1.0
pkgrel=1
pkgdesc='A shell like command line interface for mqtt written in go.'
arch=('x86_64' 'i686')
url="https://github.com/rainu/mqtt-shell"
license=('MIT')
makedepends=('git' 'go>=1.14')
source=("git+$url.git#tag=v$pkgver")
sha256sums=("SKIP")

prepare(){
  cd "$srcdir/$pkgname"
  mkdir -p build/
}

build() {
  cd "$srcdir/$pkgname"
  CGO_ENABLED=0 go build -a -installsuffix cgo -ldflags "-s -w" -o build ./cmd/...
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}