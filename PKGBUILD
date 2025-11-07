# Maintainer: Edinei Cavalcanti <hi@edinei.dev>
pkgbase=openvpn-manager-git
_pkgname='openvpn-manager'
pkgname="$_pkgname-git"
pkgver=30.f875392
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
source=("$_pkgname"::"git+https://github.com/neiesc/openvpn-manager")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
