# Maintainer: Edinei Cavalcanti <hi@edinei.dev>
pkgbase=openvpn-manager-git
pkgname=('openvpn-manager-git')
pkgver=22.3a96297
pkgrel=1
pkgdesc="Command-line tool to manage OpenVPN 2.x and OpenVPN 3.x (start/stop VPN and more commands)."
arch=('x86_64')
url="https://github.com/neiesc/openvpn-manager/tree/main"
license=('MIT')
depends=('openvpn3' 'openvpn')
optdepends=('openvpn3-indicator-git')
conflicts=('openvpn-manager')
provides=('openvpn-manager')
makedepends=('git' 'cargo')
source=("openvpn-manager"::"git+https://github.com/neiesc/openvpn-manager")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/openvpn-manager"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/openvpn-manager"
  cargo build --release --locked
}

package() {
  cd "$srcdir/openvpn-manager"
  install -Dm755 "target/release/openvpn-manager" "$pkgdir/usr/bin/openvpn-manager"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
