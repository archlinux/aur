# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bao
pkgver=0.11.0
pkgrel=1
pkgdesc="A verified streaming tool"
arch=('i686' 'x86_64')
url="https://github.com/oconnor663/bao"
license=('apache' 'custom')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oconnor663/bao/archive/$pkgver.tar.gz")
sha256sums=('03c8a37ea55dd04447226f75205851db594d4e8f054dea95ccebf0d8824725df')


check() {
  cd "$pkgname-$pkgver"

  cargo test \
    --release
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgver/bao_bin"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/bao"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bao"
}
