# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="watershot"
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple wayland native screenshot tool."
arch=("x86_64")
url="github.com/Kirottu/watershot"
license=('GPL3')
depends=(grim)
provides=(watershot)
makedepends=(git cargo)
source=("https://github.com/Kirottu/watershot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a014e0e54306359112d4220e516bd2cb6dd2cb8379ed8cc7103aa27edbe6959e')

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

