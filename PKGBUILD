# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono
pkgver=0.4.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
depends=('nftables' 'iptables' 'procps-ng' 'coreutils' 'findutils')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('eabfef5920751e2f8a38051f7d245f0c6c3244edd74ad66ace274100b6b61924')
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
