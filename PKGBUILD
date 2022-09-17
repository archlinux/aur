# Maintainer: ml <>
pkgname=hurl-rs
pkgver=1.7.0
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2')
makedepends=('cargo' 'gcc' 'python')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('65bf5bdf873eb724194cd0da1ea928a627043e4ade3427505005778b35158413582b44b7c1efa6163e1fa95f490d7a6f38953d76caf9d2b31f4516f76c472e57')

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
