pkgname=emqutiti
pkgver=0.7.7
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/emqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7aee5f886d7d8124ce7ec71a06eb195a69cf0ca20693afdbae6eaa79524e4e6d')

build() {
  cd "emqutiti-$pkgver"
  go build -trimpath -ldflags="-s -w -X github.com/marang/emqutiti/cmd.version=$pkgver" -o emqutiti ./cmd/emqutiti
}

package() {
  cd "emqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
