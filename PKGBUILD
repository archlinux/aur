# Maintainer: Amolith <amolith@secluded.site>
pkgname=dela
pkgver=0.0.6
pkgrel=1
pkgdesc='A task runner that delegates the work to other tools'
arch=('x86_64' 'aarch64')
url='https://github.com/aleyan/dela'
license=('MIT')

depends=('glibc' 'gcc-libs')
makedepends=('cargo')
conflicts=('dela-git')
source=("$pkgname-$pkgver.crate::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
b2sums=('65872d3adf4ac06efde03bbd0930781478b7f5e124760b5777de1ea377212ebc10ad956c5d128651e92b5b5b3ab40bbaa755fb7979519ce61db5b83105cf53e2')

build() {
  cd "$srcdir/$pkgname-$pkgver" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all-features
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
