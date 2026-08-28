# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=basalt
pkgver=0.12.7
pkgrel=1
pkgdesc='A TUI Application to manage Obsidian notes'
url='https://github.com/erikjuhani/basalt'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'armv7h')
source=("$url/archive/refs/tags/basalt/v$pkgver.tar.gz")
sha256sums=('0707f113967ca3c86499ec3cf35441cf33e2785d31c941b3e49c5d892e17a9c5')
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

  export BASALT_VERSION="0.12.7"
  export BASALT_COMMIT_SHORT_HASH="90a6507"
  export BASALT_COMMIT_DATE="2026-08-15"
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
