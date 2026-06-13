# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=2.2.1
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord, written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(glibc libgcc alsa-lib opus)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f68b0b0ac8af7609d1ae1b5cba84cfc597afea0d10a4e28d081e33edc57d28e8')
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
  install -vDm 755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
}
