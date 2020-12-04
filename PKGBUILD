# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono
pkgver=0.6.2
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('651c9c9c9a0e707c822ab2ce8d816d57a43123e82d0e349f82e44b931793f1f6')
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
