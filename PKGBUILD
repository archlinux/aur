# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-dictionary"
pkgver=0.1.0
pkgrel=1
pkgdesc="Dictionary plugin for looking up word definitions."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-dictionary"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-dictionary/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9b4f42cfdb0af631bf97d19eb550ba2b5abb3e54025eeb97df57049f755d8c2')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release 
}

package() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libdictionary.so"
}
