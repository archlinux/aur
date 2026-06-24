# Maintainer: n0pashkov <n0pashkov@gmail.com>
pkgname=netbird-tui
pkgver=1.2
pkgrel=1
pkgdesc="Terminal UI for NetBird WireGuard mesh VPN"
arch=('x86_64')
url="https://github.com/n0pashkov/netbird-tui"
license=('MIT')
optdepends=('netbird: NetBird daemon (required at runtime)')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f739d8f110b7b70460c8412cf542481528c0a195cfb9bcef8c1bf8991c8bf431')

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
