# Maintainer: Dimitri Merejkowsky <dimitri@dmerej.info>
pkgname=ruplacer
pkgver="0.6.4"
pkgrel=1
pkgdesc="Find and replace text in source files"
url="http://github.com/dmerejkowsky/ruplacer"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("ruplacer-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4f66e8970942e55dc287c585eef7a21394aefa49df746cef429f9e5bc6714c7a')

prepare() {
  cd ruplacer-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ruplacer-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}


check() {
  cd ruplacer-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ruplacer-$pkgver
  install -Dm755 target/release/ruplacer "${pkgdir}/usr/bin/ruplacer"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/ruplacer/LICENSE
}
