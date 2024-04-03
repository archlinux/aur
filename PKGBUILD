# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-shell"
pkgver=0.1.0
pkgrel=1
pkgdesc="Shell plugin for running shell commands."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-shell"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-shell/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b16ad53bded3fabcad6bd366b84d0dcfe1dbb4b9ac8c20e606f7fed2f89d321')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libshell.so"
}
