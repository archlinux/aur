# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=git-cliff
pkgver=0.1.0
pkgrel=1
pkgdesc="A highly customizable changelog generator"
arch=('x86_64')
url="https://github.com/orhun/git-cliff"
license=('GPL3')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('633aa1b03db408c494dbc5f9d93f1244a94241b717a6ffa85c8c8717dc2c51a0c184db021a1cc9fc9fdbc22acfb0ac1d139e7201dede9676cca7f027eb05408b')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen -- --skip "git_log"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
