# Maintainer: Izu <ccatdev@proton.me>

pkgname=concord
pkgver=2.1.9
pkgrel=1
pkgdesc="A feature-rich TUI client for Discord, written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/chojs23/concord"
license=(GPL-3.0-only)
depends=(glibc libgcc alsa-lib opus)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9dda0b9997e6242858165b3b4e3be3a3e85f948b265ddae190535b1562f9d44')
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
