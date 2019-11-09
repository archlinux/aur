# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e
pkgver=0.1.0
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('i686' 'x86_64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
depends=('gcc-libs')
makedepends=('rust'
  # aom dependency
  'cmake' 'perl' 'nasm')
# aom dependency
checkdepends=('python')
source=("https://github.com/xiph/rav1e/archive/$pkgver.tar.gz")
sha256sums=('00395087eaba4778d17878924e007716e2f399116b8011bf057fd54cc528a6cb')


build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"

  cargo install --root "$pkgdir/usr" --path "$srcdir/rav1e"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/rav1e"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rav1e"
  install -Dm644 "PATENTS" -t "$pkgdir/usr/share/licenses/rav1e"

  rm "$pkgdir/usr/.crates.toml"
}
