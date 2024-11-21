# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passepartui
pkgver=0.1.4
pkgrel=1
pkgdesc="A TUI for pass"
arch=('x86_64')
url="https://github.com/kardwen/passepartui"
license=('MIT')
depends=('gcc-libs' 'pass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3eb3a3cad8850bef8d50e84885a16694c1b35a2833ea7a2885d58234613426a816893d44d5e49a936aa35507f495365f9ac97eff22e7173b1a18b9497a7fce22')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
