# Maintainer: ml <>
pkgname=hurl-rs
pkgver=1.8.0
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2')
makedepends=('cargo' 'gcc' 'python')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('e5f17da1e09741830a42f421032a9912b1034b85396acd645ca3caa13f2c8cc79dc60bbc745fa22346bbfb738cc79e461e012a60da4e3c7e1d65e6bb75e05a9b')

prepare() {
  cd hurl-"$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd hurl-"$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  bin/release/man.sh
  bin/release/release.sh
}

package() {
  cd hurl-"$pkgver"
  install -Dm755 target/release/hurl{,fmt} -t "$pkgdir"/usr/bin
  install -Dm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir"/usr/share/man/man1
}
