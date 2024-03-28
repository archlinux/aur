# Maintainer: Dimitri Merejkowsky <d.merej at gmail>
pkgname=rusync
pkgver="0.7.2"
pkgrel=1
pkgdesc="Minimalist rsync implementation in Rust"
url="https://github.com/your-tools/rusync/"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("rusync-$pkgver.tar.gz::https://github.com/your-tools/rusync/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('78136abaa4089fb8018cec6acf3ba08f48341f1404be16b52da3e829edb0da43')


prepare() {
  cd "rusync-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "rusync-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "rusync-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-features
 }

package() {
  cd "rusync-${pkgver}"
  install -Dm0755 target/release/rusync "${pkgdir}/usr/bin/rusync"
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/rusync/LICENSE
}

# vim:set ts=2 sw=2 et:
