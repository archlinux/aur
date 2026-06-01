# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=2.1.8
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord, written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(glibc libgcc alsa-lib opus)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b6f078b13407019eb3663f957be218670b5d9c42a5d59b0cc9753c3f767f9a3')
options=('!lto')

prepare() {
  cd $pkgname-$pkgver

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver

  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver

  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
