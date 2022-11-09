# Maintainer: Your name <bros at brocode dot sh>

pkgname=comtrya
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool to help provision a fresh OS with the packages and configuration (dotfiles) you need to become productive again."
arch=('x86_64')
url="https://github.com/comtrya/comtrya"
license=('custom:MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('f9114430bd8765d987541c95197a98bf1afecd1e97c015618da6a07aa0fdfb8b')

build() {
  cd "$pkgname-v.$pkgver"
  cargo build --locked --release --all-features
}

check() {
  cd "$pkgname-v.$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-v.$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
