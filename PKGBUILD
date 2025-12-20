# Maintainer: Václav Šmejkal <engo@satan.red>
pkgname=why2
pkgver=0.3.0
pkgrel=3
pkgdesc="Lightweight, fast, secure, and easy to use encryption system."
arch=('x86_64' 'aarch64')
url="https://git.satan.red/ENGO150/WHY2.git"
license=('GPL-3.0-only')
depends=('openssl')
makedepends=('git' 'rust' 'pkgconf')
source=("git+$url#branch=release")
sha256sums=('SKIP')

options=('!debug')

build() {
  cd "WHY2"
  cargo build --release
  cargo build --bin why2-server --no-default-features --features server --release
}

package() {
  cd "WHY2"
  install -Dm755 "target/release/why2" "$pkgdir/usr/bin/why2"
  install -Dm755 "target/release/why2-server" "$pkgdir/usr/bin/why2-server"
}
