# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-rink"
pkgver=0.1.0
pkgrel=1
pkgdesc="Rink plugin for calculator and unit conversion."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-rink"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-rink/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a020090efe88e484a1a625b11185b52bad2b866487e38b77388971db2cd99e3')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/librink.so"
}
