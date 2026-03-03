# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=kdlfmt
pkgver=0.1.6
pkgrel=1
pkgdesc="A formatter for kdl documents."
arch=('x86_64')
url="https://github.com/hougesen/kdlfmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hougesen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4e3d17adca3f41a2304eebaf7e7142395305d4041695317e4115498139b081b164ee3ab61472f15ba6df77556c8d7b0cbcd9854d188452befbb9c0ee21df3ce4')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo check
  cargo build --release --locked
}


package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/kdlfmt" "$pkgdir/usr/bin/kdlfmt"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

