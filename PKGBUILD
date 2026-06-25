# Maintainer: rabbull <karl.liu.1024@gmail.com>
pkgname=reckless
pkgver=0.9.0
pkgrel=1
pkgdesc='Competitive UCI chess engine written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/codedeliveryservice/Reckless'
license=('AGPL-3.0-only')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'clang')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39a69c82b5bd8ef2b57db6c115128479a51dcd716c509360853bff41dbf9d273')

prepare() {
  cd "Reckless-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Reckless-$pkgver"

  make
}

check() {
  cd "Reckless-$pkgver"

  cargo test --release --locked
}

package() {
  cd "Reckless-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
