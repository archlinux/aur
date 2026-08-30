# Maintainer: Václav Šmejkal <engo@satan.red>
pkgname=why2
pkgver=2.0.0
pkgrel=1
pkgdesc="Lightweight, fast and secure chat application powered by WHY2 encryption."
arch=('x86_64' 'aarch64')
url="https://git.satan.red/ENGO150/WHY2.git"
license=('GPL-3.0-only')
depends=('alsa-lib' 'opus' 'gcc-libs')
makedepends=('git' 'cargo' 'clang' 'pkgconf')
source=("git+$url#branch=release")
sha256sums=('SKIP')

options=('!debug' '!lto')

build() {
  cd "WHY2"
  cargo build --release
  cargo build --bin why2-server --no-default-features --features server --release
}

package() {
  cd "WHY2"
  install -Dm755 "target/release/why2" "$pkgdir/usr/bin/why2"
  install -Dm755 "target/release/why2-server" "$pkgdir/usr/bin/why2-server"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
