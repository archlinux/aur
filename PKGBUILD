# Maintainer: Sqrilizz <https://github.com/Sqrilizz>

pkgname=ffind-rs
pkgver=0.3.0
pkgrel=1
pkgdesc="High-performance, multi-threaded file finder for Linux with gitignore support and fuzzy matching"
arch=(x86_64)
url="https://github.com/Sqrilizz/ffind"
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(rust git)
provides=(ffind)
conflicts=(ffind ffind-rs-bin)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=("SKIP")
options=(!lto)

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  cargo test --frozen
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/ffind -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
