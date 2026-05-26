# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=2.1.4
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord, written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(glibc libgcc alsa-lib opus)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a055e6910c1e84b395e9ee354bb3b51b2dd45a13e0bdf640662db5483eb1c98f')
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
