pkgname=electrs
pkgver=0.7.0
pkgrel=1
pkgdesc="An efficient re-implementation of Electrum Server in Rust"
arch=(x86_64)
url="https://github.com/romanz/electrs"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'clang' 'cmake' 'rust')
#source=("git+https://github.com/romanz/electrs.git#tag=v$pkgver")
# FIXME v0.7.0 tag doesn't include the correct Cargo.lock so using the next commit that includes it
source=("git+https://github.com/romanz/electrs.git#commit=dc92454c9d8d681ebf50cca98189526e6580a2ee")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked
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
