# Maintainer: EasyCanadianGamer <https://github.com/EasyCanadianGamer>
pkgname=openconnect-tui-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Open-source TUI for GlobalProtect VPN (openconnect-gp)"
arch=('x86_64')
url="https://github.com/EasyCanadianGamer/openconnect-tui"
license=('MIT')
depends=('globalprotect-openconnect')
makedepends=('rust' 'cargo')
provides=('openconnect-tui')
conflicts=('openconnect-tui')
source=("$pkgname::git+https://github.com/EasyCanadianGamer/openconnect-tui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$pkgname"
  cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/openconnect-tui" "$pkgdir/usr/bin/openconnect-tui"
  # Uncomment once you add a LICENSE file:
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
