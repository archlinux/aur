# Maintainer: Edinei Cavalcanti <hi@edinei.dev>
pkgname=openvpn_manager
pkgver=10.8f8d8eb
pkgrel=1
pkgdesc="Command-line tool to manage OpenVPN 2.x and OpenVPN 3 sessions (start/stop, with more commands planned)."
arch=('x86_64')
url="https://github.com/neiesc/openvpn_manager/tree/main"
license=('MIT')
depends=('openvpn3' 'openvpn')
conflicts=('openvpn_manager')
provides=('openvpn_manager')
makedepends=('git' 'cargo')
source=("${pkgname}"::"git+https://github.com/neiesc/openvpn_manager")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
