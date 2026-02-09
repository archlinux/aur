# Maintainer: vghbjc

pkgname="serve_md"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="Serve a markdown file as an HTML web server"
arch=('x86_64')
url="https://github.com/GhelloZ/serve_md"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GhelloZ/serve_md/archive/refs/tags/v$pkgver.tar.gz")

b2sums=('512d2cbd971f5ac3d9eba40da956665ba118f276898dd68b0b6479350b21d6c1145ee0940b815a38025233e5152bd02fa17ee18cf3d1eae2e9581e8d7dc4af83')
sha512sums=('0fe4b443cb3aa80833aea3c080d82c31d5056caa4d3c34c0d62293ee74d1ff181c7d5328514c0168dc99041d9ed3f91723b9546aeef9af20fbb8a278773552dc')
sha256sums=('807399ae9528e24a3bac4f2fe21201d3cd04d84d547fb3de9a080b6cf1680737')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo install \
    --no-track \
    --frozen --locked \
    --path . \
    --root "$pkgdir/usr" \
    --bin serve_md

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

