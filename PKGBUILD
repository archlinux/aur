# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono
pkgver=0.8.9
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4e76a39b720cc97da2c8d438fb9c1317c97a7034f3bfc70717f9fa997c4d1837')
provides=('vopono')
conflicts=('vopono')

build() {
  cd "$pkgname-$pkgver"
  
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
