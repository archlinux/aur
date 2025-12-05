pkgname=emqutiti
pkgver=0.6.6
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/emqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25909949245c4ad920b1d8501639a2a60d5b85e8d6a8b9ecc9fd8d95964de58b')

build() {
  cd "emqutiti-$pkgver"
  go build -trimpath -ldflags="-s -w -X github.com/marang/emqutiti/cmd.version=$pkgver" -o emqutiti ./cmd/emqutiti
}

package() {
  cd "emqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
