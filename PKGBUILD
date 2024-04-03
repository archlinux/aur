# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-stdin"
pkgver=0.1.0
pkgrel=1
pkgdesc="Stdin plugin for dmenu-like operation."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-stdin"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-stdin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f04326ac4b946a5b888ef4bfb38427dcadb4618e6f7b35c8690f11f60da7cba')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libstdin.so"
}
