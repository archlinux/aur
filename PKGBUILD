# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=basalt
pkgver=0.13.0
pkgrel=1
pkgdesc='A TUI Application to manage Obsidian notes'
url='https://github.com/erikjuhani/basalt'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'armv7h')
source=("$url/archive/refs/tags/basalt/v$pkgver.tar.gz")
sha256sums=('0d9dfb1ffe26d2bbe7c4c4eb74354e17aff2c297b69df75bfa89e006fac8d011')
_srcdir="$pkgname-$pkgname-v$pkgver"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  export BASALT_VERSION="0.13.0"
  export BASALT_COMMIT_SHORT_HASH="1591cbd"
  export BASALT_COMMIT_DATE="2026-10-04"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --workspace --frozen --all-features
}

package() {
  cd "$_srcdir"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
