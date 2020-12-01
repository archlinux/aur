pkgname=electrs
pkgver=0.8.6
pkgrel=1
pkgdesc="An efficient re-implementation of Electrum Server in Rust"
arch=(x86_64)
url="https://github.com/romanz/electrs"
license=('MIT')
depends=('gcc-libs' 'rocksdb')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("git+https://github.com/romanz/electrs.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  ROCKSDB_INCLUDE_DIR=/usr/include ROCKSDB_LIB_DIR=/usr/lib cargo build --locked --no-default-features --release
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
