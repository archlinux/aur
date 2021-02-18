# Maintainer: Ivan Tham <pickfire@riseup.net>

pkgname=babelfish
pkgver=0.2.1
pkgrel=0
pkgdesc='Universal translater for encodings'
arch=('x86_64')
url=https://github.com/pickfire/babelfish
license=('Apache' 'MIT')
depends=()
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('520ba73aa1e108aa4cf68403ad186ad310365df57a8f24c45c9cca26b0cf4b09')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  find "$srcdir"/$pkgname-$pkgver/target/release/ -maxdepth 1 -executable -type f \
    -exec install -Dm755 -t "$pkgdir"/usr/bin '{}' \;
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/$pkgname-$pkgver/LICENSE-*
}
