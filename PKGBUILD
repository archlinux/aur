# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="anyrun-plugin-applications"
pkgver=0.1.0
pkgrel=1
pkgdesc="Applications plugin for searching and running system-specific desktop entries."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-applications"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("https://github.com/anyrun-org/plugin-applications/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('04659c27cbb55ec9f30f9ba3a7934b817319b3cfcadaca7a35126cca88259a2d')

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
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libapplications.so"
}
