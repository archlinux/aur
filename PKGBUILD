# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tracker
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based real-time satellite tracking and orbit prediction application"
arch=('x86_64')
url="https://github.com/ShenMian/tracker"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4a5903ed4d6ce4163d6bfbc225c632194ac69e1039274c086ef16b256bb78bc732a790412b803624013aa5ac7f65e0bc05a5a18a947b7775d28d74c138717003')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
}
