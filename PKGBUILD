# Maintainer: Will Daly <will.e.daly@gmail.com>
pkgname=devlog
pkgver=1.0.4
pkgrel=1
pkgdesc="Command-line tool for tracking your day-to-day software development work."
arch=('x86_64')
url="https://github.com/wedaly/devlog"
license=('MIT')
depends=('nano')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wedaly/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('dce5bc1390f1246b8c3240dc416aa64f2912f9c24df8a2f415a24ef9955e085799b8a36f1a58a3f0b7b6012ec1bdd8448b02b687d7437b8fad76db0dd4321477')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/devlog" "$pkgdir/usr/bin/devlog"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

