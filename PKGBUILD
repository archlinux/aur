# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=termframe
pkgver=0.7.7
pkgrel=1
pkgdesc='Convert terminal output into an SVG file'
url='https://github.com/pamburus/termframe'
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('cargo')
options=('!lto')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('edcf6624838d752bd432b4b8cf976807422fcbce8cedef585209d97556a561fc')

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
