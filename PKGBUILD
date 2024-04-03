# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-translate"
pkgver=0.1.0
pkgrel=1
pkgdesc="Translate plugin for quick text translation."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-translate"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-translate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9609ce9a42999bc17a99049efa73595fac93a4de39b4308746814775b6bbaa8e')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libtranslate.so"
}
