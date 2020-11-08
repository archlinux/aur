# Maintainer: Ivan Tham <pickfire@riseup.net>

pkgname=babelfish
pkgver=0.1.2
pkgrel=1
pkgdesc='Universal translater for encodings'
arch=('x86_64')
url=https://github.com/pickfire/babelfish
license=('Apache' 'MIT')
depends=()
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('165f5acf5108dc8e4bf6e58e4d563a7112613340fa8316af482582383e1ffe15')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  find "$srcdir"/$pkgname-$pkgver/target/release/ -maxdepth 1 -executable -type f \
    -exec install -Dm755 -t "$pkgdir"/usr/bin '{}' \;
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/$pkgname-$pkgver/LICENSE-*
}
