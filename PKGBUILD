
pkgname=uutils-coreutils-stty
pkgver=0.1.0
pkgrel=2
pkgdesc='Rust rewrite of stty (no man pages)'
arch=('x86_64')
url='https://uutils.github.io/'
license=('MIT')
depends=(gcc-libs glibc)
makedepends=(rust)
conflicts=(uutils-coreutils-git)
source=($pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz)
sha256sums=('55c528f2b53c1b30cb704550131a806e84721c87b3707b588a961a6c97f110d8')
options=('!lto') # RUSTFLAGS= -C lto=thin also fail

RUSTFLAGS="-C panic=abort $RUSTFLAGS --remap-path-prefix=${srcdir}="

#prepare() { DL larger crate
#  cd coreutils-$pkgver
#  cargo fetch --target "${CARCH}"-unknown-linux-gnu --locked
#}

build() {
  cd coreutils-$pkgver
  cargo build -p uu_stty --release
}

package() {
  install -Dm755 coreutils-$pkgver/target/release/stty "$pkgdir"/usr/bin/uu-stty
}
