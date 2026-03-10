# Maintainer: n0pashkov <n0pashkov@gmail.com>
pkgname=netbird-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal UI for NetBird WireGuard mesh VPN"
arch=('x86_64')
url="https://github.com/n0pashkov/netbird-tui"
license=('MIT')
optdepends=('netbird: NetBird daemon (required at runtime)')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('92d7d06934a26815c4bd509c196ed2833b2c0251bacba800b28460570d05c4df')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags="-s -w" -o netbird-tui .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 netbird-tui "$pkgdir/usr/bin/netbird-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
