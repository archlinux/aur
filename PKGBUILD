# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dra
pkgver=0.2.1
pkgrel=1
pkgdesc="A command line tool to download assets from GitHub releases"
arch=('x86_64')
url="https://github.com/devmatteini/dra"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0f20a2f5fd908a0e43f2a109ba3b8fd9d4f64beca4f5ace6bf9bdd35cd11ead20a610288ba6cad375adceef65fe8abda2708f894dfc9c6ceeadcc01e9b73a6c9')
options=('!lto')

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
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
