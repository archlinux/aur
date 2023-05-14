# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="watershot"
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple wayland native screenshot tool."
arch=("x86_64")
url="github.com/Kirottu/watershot"
license=('GPL3')
depends=(grim)
provides=(watershot)
makedepends=(git cargo)
source=("https://github.com/Kirottu/watershot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27dd332973aef9c101cad0b01e8ba19ed3542882c0dfcbe346f72621479f6412')

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

