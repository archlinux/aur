# Maintainer: Sami Ben Romdhane <beromdhane@gmail.com>
pkgname=salam
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple logout/shutdown dialog for Linux (Rust version)"
arch=('x86_64')
url="https://codeberg.org/samibr/salam"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/samibr/salam/archive/v$pkgver.tar.gz")
sha256sums=('d6e174c3e6fd6126983d5185435817aafc54a490dda06ad64e0c581f74202ed3')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  
  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install images
  install -dm755 "$pkgdir/usr/share/$pkgname/img"
  install -m644 img/*.png "$pkgdir/usr/share/$pkgname/img/"
}
