# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-symbols"
pkgver=0.1.0
pkgrel=1
pkgdesc="Symbols plugin for searching unicode symbols."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-symbols"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-symbols/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a0b57756e99ae3d914b2aa521fc5165342ff6999b40ae65a9916092bb7d9460')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libsymbols.so"
}
