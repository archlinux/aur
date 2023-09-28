# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=xdvdfs
pkgver=0.6.0
pkgrel=1
pkgdesc="A collection of tools for interacting with XDVDFS/XISO images."
arch=('x86_64')
url="https://github.com/antangelo/xdvdfs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/antangelo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3a6d9ac4d2b2a7f9a920fef356b37a0c843b10ff97b25657bdd25353a334cd94')

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
