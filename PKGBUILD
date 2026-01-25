# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=basalt
pkgver=0.12.0
pkgrel=1
pkgdesc='A TUI Application to manage Obsidian notes'
url='https://github.com/erikjuhani/basalt'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64' 'aarch64' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/basalt/v$pkgver.tar.gz")
sha256sums=('a62e94b0765cf8b7895336fdd8278d60e6de6c0b7974c26a9aab86dff31731da')
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
