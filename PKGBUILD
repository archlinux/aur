pkgname=emqutiti
pkgver=0.7.15
pkgrel=2
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://automation.izoone.com/releases/emqutiti"
license=('MIT')
depends=()
options=('!debug')
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::$url/v$pkgver/emqutiti-bce91a47a2d73df3a41696b32de7fee8ce855980.tar.gz")
sha256sums=('7ab802bd5bb1b6716fdd98eadc027137f5086f2af82b3a9c7228c74a11a6a6f0')

build() {
  cd "emqutiti-bce91a47a2d73df3a41696b32de7fee8ce855980"
  CGO_ENABLED=0 go build -buildvcs=false -trimpath -ldflags="-s -w -X github.com/marang/emqutiti/cmd.version=$pkgver" -o emqutiti ./cmd/emqutiti
}

package() {
  cd "emqutiti-bce91a47a2d73df3a41696b32de7fee8ce855980"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
