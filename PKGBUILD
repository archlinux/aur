pkgname=emqutiti
pkgver=0.8.1
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://entire.com/et/marang/emqutiti"
license=('MIT')
depends=()
options=('!debug')
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::https://get.izoone.com/emqutiti/v$pkgver/emqutiti-658c896ae5e7996357389641d06397ead114cc92.tar.gz")
sha256sums=('da2f46c05f24155acaadc193a0d76ca8d3ecfb1073009d4a09c855f8507aae2e')

build() {
  cd "emqutiti-658c896ae5e7996357389641d06397ead114cc92"
  CGO_ENABLED=0 go build -buildvcs=false -trimpath -ldflags="-s -w -X go.izoone.com/emqutiti/cmd.version=$pkgver" -o emqutiti ./cmd/emqutiti
}

package() {
  cd "emqutiti-658c896ae5e7996357389641d06397ead114cc92"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
