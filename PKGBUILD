# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="kidex"
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple file indexing service"
arch=("x86_64")
url="github.com/Kirottu/kidex"
license=('GPL3')
makedepends=(git cargo)
source=("https://github.com/Kirottu/kidex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('02ca4c85b5e796df9c9587870da39a4df014247a4cc6a356e9000976decc674e')

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
}

