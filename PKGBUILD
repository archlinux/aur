# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=termframe
pkgver=0.8.2
pkgrel=1
pkgdesc='Convert terminal output into an SVG file'
url='https://github.com/pamburus/termframe'
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('cargo')
options=('!lto')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3539aa9df7ccc803e32cc70b6fd93c791dc1b8e3e20c369705730d3a103c9a4')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --workspace --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
