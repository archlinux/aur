# Maintainer: enblynx <aur at lynxdev dot xyz>
# SPDX-License-Identifier: 0BSD
pkgname=wg-tui-git
pkgver=0.3.0.r0.g2ea7f70
pkgrel=1
pkgdesc="A terminal user interface for managing WireGuard VPN tunnels."
arch=('x86_64')
url="https://github.com/excoffierleonard/wg-tui"
license=('MIT')
provides=('wg-tui')
makedepends=('cargo' 'git')
depends=('sudo' 'wireguard-tools')
conflicts=('wg-tui')
source=("$pkgname::git+https://github.com/excoffierleonard/wg-tui")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$pkgname"

  cargo build --release --locked
}

check() {
  cd "$pkgname"

  cargo test --release --locked
}


package() {
  cd "$pkgname"
  install -Dm755 "target/release/wg-tui" "$pkgdir/usr/bin/wg-tui"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
