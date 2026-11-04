pkgname=emqutiti
pkgver=0.8.0
pkgrel=2
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://entire.com/et/marang/emqutiti"
license=('MIT')
depends=()
options=('!debug')
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::https://get.izoone.com/emqutiti/v$pkgver/emqutiti-e897315937081d84e5bfb26f3d190317ff6347f3.tar.gz")
sha256sums=('afea74c4264e6f7bafea5bc88b95dfdef8a043714834760785700ce8a236b4d7')

build() {
  cd "emqutiti-e897315937081d84e5bfb26f3d190317ff6347f3"
  CGO_ENABLED=0 go build -buildvcs=false -trimpath -ldflags="-s -w -X go.izoone.com/emqutiti/cmd.version=$pkgver" -o emqutiti ./cmd/emqutiti
}

package() {
  cd "emqutiti-e897315937081d84e5bfb26f3d190317ff6347f3"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
