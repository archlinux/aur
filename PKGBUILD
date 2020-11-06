# Maintainer: Hardy <hardy7cc at gmail dot com>

pkgname=anu
pkgver=1.0.0_alpha
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://anu.dev'
makedepends=('cargo')
depends=('gcc-libs' 'openssl' 'libsodium' 'clang' 'xxhash' 'zstd')
optdepends=('libgit2: git import support')
arch=('x86_64')
license=('GPL2')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://crates.io/api/v1/crates/anu/${pkgver//_/-}/download")
sha256sums=('9127b330f2b3e6d66748e99a052ba341b469d3c780d4f659817759bca05533bc')

build() {
  cd $srcdir/"$pkgname-${pkgver//_/-}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd $srcdir/"$pkgname-${pkgver//_/-}"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
