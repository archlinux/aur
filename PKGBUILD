pkgname=emqutiti
pkgver=0.7.16
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://automation.izoone.com/releases/emqutiti"
license=('MIT')
depends=()
options=('!debug')
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::$url/v$pkgver/emqutiti-fe91099de8b683091eb03afb78f20e6ddccaca3b.tar.gz")
sha256sums=('d8bfaab788fbc02482cd35955c758a77c662e501ad648e5a492f205607977e0e')

build() {
  cd "emqutiti-fe91099de8b683091eb03afb78f20e6ddccaca3b"
  CGO_ENABLED=0 go build -buildvcs=false -trimpath -ldflags="-s -w -X github.com/marang/emqutiti/cmd.version=$pkgver" -o emqutiti ./cmd/emqutiti
}

package() {
  cd "emqutiti-fe91099de8b683091eb03afb78f20e6ddccaca3b"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
