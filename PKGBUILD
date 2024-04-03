# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-kidex"
pkgver=0.1.0
pkgrel=1
pkgdesc="Kidex plugin for file search."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-kidex"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-kidex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('61fa4fc368fdb94db0552b069881b1f93f4fc2b34abdbdb6aa28a97d8b348a6b')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libkidex.so"
}
