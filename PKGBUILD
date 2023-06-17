# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=xdvdfs
pkgver=0.5.0
pkgrel=1
pkgdesc="A collection of tools for interacting with XDVDFS/XISO images."
arch=('x86_64')
url="https://github.com/antangelo/xdvdfs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/antangelo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5ec8fbad97a74070b9d65c9f1087e3d2913a2febe044423200f4c1accccf6e3f')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/xdvdfs "${pkgdir}/usr/bin/xdvdfs"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
