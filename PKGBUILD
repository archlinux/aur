# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono
pkgver=0.10.9
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections' 'libnatpmp: for ProtonVPN port forwarding support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f917d8b3d8b345f159d3d78aa77e6ed0a464a0541bb35a0983e8f4818daec61c')
provides=('vopono')
conflicts=('vopono')
options=('!lto')

build() {
  cd "$pkgname-$pkgver"
  
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
