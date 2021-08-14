# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=git-cliff
pkgver=0.1.2
pkgrel=1
pkgdesc="A highly customizable changelog generator"
arch=('x86_64')
url="https://github.com/orhun/git-cliff"
license=('GPL3')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8a38d2e9c7b8a985071797a70f3cfa9f94ee17c8a5e85df342332c5444ba909e224164b4061b4b1bf4489e4cb90333945db2666e0359018eab0de5bf50202707')

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
