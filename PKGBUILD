# Maintainer: Ivan Tham <pickfire@riseup.net>

pkgname=babelfish
pkgver=0.2.0
pkgrel=0
pkgdesc='Universal translater for encodings'
arch=('x86_64')
url=https://github.com/pickfire/babelfish
license=('Apache' 'MIT')
depends=()
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('db8e13e6603908f3d573676ec78a4d17814b897f1567654a315f9ad2568a8259')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  find "$srcdir"/$pkgname-$pkgver/target/release/ -maxdepth 1 -executable -type f \
    -exec install -Dm755 -t "$pkgdir"/usr/bin '{}' \;
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/$pkgname-$pkgver/LICENSE-*
}
