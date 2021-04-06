# Maintainer: lmartinez-mirror
pkgname=kiro
pkgver=0.4.3
pkgrel=1
pkgdesc="A tiny UTF-8 text editor"
arch=('x86_64')
url="https://github.com/rhysd/kiro-editor"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47081ee06b0fde498905c2ad9a2b215eef397eebe2a046ff10c70f44b5db52a1')

prepare() {
  test -d "$pkgname-$pkgver" || mv "kiro-editor-$pkgver" "$pkgname-$pkgver"
}

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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
