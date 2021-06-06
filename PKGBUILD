# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono
pkgver=0.8.2
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7af74302fb468e02598281647f17350ec9b87c1749df09a9c5fc1c52f336b9ab')
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
