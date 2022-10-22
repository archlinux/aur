# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rusty-krab-manager
pkgver=1.3
pkgrel=1
pkgdesc="Time management TUI"
arch=('x86_64')
url="https://github.com/aryakaul/rusty-krab-manager"
license=('custom:ETHICAL')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('846737607c6d00404a6a6886e4778c416f06fef120f3e7f95e94cecdf8549f4cc981ac98eb15b518cc4e22735c786a313fe90f9d976780d97fe868d04c394300')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
