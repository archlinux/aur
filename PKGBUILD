# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="watershot"
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple wayland native screenshot tool."
arch=("x86_64")
url="github.com/Kirottu/watershot"
license=('GPL3')
depends=(grim vulkan-driver)
provides=(watershot)
makedepends=(git cargo)
source=("https://github.com/Kirottu/watershot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d3ee3ee8914c182aab4a1bb3b99488264b4c4c1de3a5393233c4fcb4d6bec7a')

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
