# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=tgrep
pkgver=1.0.4
pkgrel=1
pkgdesc='Trigram-indexed grep: fast regex search for large codebases with a client/server architecture'
arch=('x86_64' 'aarch64')
url='https://github.com/microsoft/tgrep'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/tgrep/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c199dc73bd98d85a0ece8834e0353d528cada6dca315cac7af572a15e93a4e1f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tgrep "$pkgdir/usr/bin/tgrep"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
