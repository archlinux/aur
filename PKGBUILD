# Maintainer: KirottuM <arnovaara@gmail.com>
pkgname="watershot"
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple wayland native screenshot tool."
arch=("x86_64")
url="github.com/Kirottu/watershot"
license=('GPL3')
depends=(grim)
provides=(watershot)
makedepends=(git cargo)
source=("https://github.com/Kirottu/watershot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5329af1f6cd73b68875514d9c715702571398347107d4e991b8b437ecd36788a')

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

