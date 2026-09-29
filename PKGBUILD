# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=tgrep
pkgver=1.0.11
pkgrel=1
pkgdesc='Trigram-indexed grep: fast regex search for large codebases with a client/server architecture'
arch=('x86_64' 'aarch64')
url='https://github.com/microsoft/tgrep'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/tgrep/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3fd12a6f76186b5ee7c1072d9f60d5133028b10acea125b24fa6b813c04dd839')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tgrep "$pkgdir/usr/bin/tgrep"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
