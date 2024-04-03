# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-websearch"
pkgver=0.1.0
pkgrel=1
pkgdesc="Websearch plugin for searching the web with configurable engines."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-websearch"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-websearch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('006ee9aa3721fb84cc83b835fc7aa094d51b32a899c40995a189b8e61175bcb5')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libwebsearch.so"
}
