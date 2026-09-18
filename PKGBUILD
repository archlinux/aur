# Maintainer: Kuro <kurojs>

pkgname=ovpngate
pkgver=0.2.3
pkgrel=1
pkgdesc="Terminal-based OpenVPN client for VPN Gate with server list, filters, favorites, and connection management"
arch=('x86_64')
url="https://github.com/kurojs/ovpngate"
license=('MIT')
depends=('openvpn' 'iproute2')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ddddf78f551bf61e92a474ab20ae0fe7d09dd527b5abef2c2d9c63986f900b53')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags="-s -w -X main.Version=$pkgver" -o ovpngate ./cmd/ovpngate/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ovpngate "$pkgdir/usr/bin/ovpngate"
}
