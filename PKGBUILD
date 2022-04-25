# Maintainer: Alexander Sowitzki <dev@eqrx.net>
pkgname=wallhack
pkgdesc='Connect two linux tun interfaces together over a TLS connection'
pkgver=0.0.6
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://eqrx.net/$pkgname"
license=('AGPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eqrx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2ce905ea766b1269fa135139f20c5df1032e142f356cbee9dc42e040a41f067a8432bc60b4b174e446db3458a7ec28eeea2aa0b9e36f92a011addd59383b0556')

build() {
  cd "$pkgname-$pkgver"
  ./build.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 init/client.service "$pkgdir"/usr/lib/systemd/system/$pkgname-client.service
  install -Dm644 init/server.service "$pkgdir"/usr/lib/systemd/system/$pkgname-server.service
  install -Dm644 init/sysuser.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 init/tun.netdev "$pkgdir"/usr/lib/systemd/network/$pkgname.netdev
  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
