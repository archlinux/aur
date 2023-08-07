# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=xdvdfs
pkgver=0.5.1
pkgrel=1
pkgdesc="A collection of tools for interacting with XDVDFS/XISO images."
arch=('x86_64')
url="https://github.com/antangelo/xdvdfs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/antangelo/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('61a29bca11d476ed63ba9ef1f2bb7716f287eab8666da27950aec0c3700abf51')

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
