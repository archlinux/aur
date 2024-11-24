# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=xdvdfs
pkgver=0.8.3
pkgrel=1
pkgdesc="A collection of tools for interacting with XDVDFS/XISO images."
arch=('x86_64')
url="https://github.com/antangelo/xdvdfs"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/antangelo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('169aac2ec5f50aa551bc2bdd409a7b8cde5c920d0b515f92aa721f61fea62fba')

prepare() {
  cd "$pkgname-$pkgver"/xdvdfs-cli

  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"/xdvdfs-cli

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"/xdvdfs-cli

  install -Dm755 target/release/xdvdfs "${pkgdir}/usr/bin/xdvdfs"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
