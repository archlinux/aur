# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=ddi
pkgver=1.0
pkgrel=1
pkgdesc="A safer dd"
arch=('x86_64')
url="https://github.com/tralph3/ddi"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8853fc563d905074a7fa79ccc984398dce99ed3ce7556c6f44dbb0ace3176256')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 target/release/ddi -t "$pkgdir/usr/bin/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
