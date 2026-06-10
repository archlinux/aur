# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=2.2.0
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord, written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(glibc libgcc alsa-lib opus)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07123d997da7b9f80c6f00bd11231caa8d8cb057eeb3f0ff916b6f95e713a272')
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
