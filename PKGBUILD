# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=asciinema-agg
pkgver=1.4.2
pkgrel=1
pkgdesc="asciinema gif generator"
arch=(x86_64)
url=https://github.com/asciinema/agg
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo)
source=(https://github.com/asciinema/agg/archive/v$pkgver/agg-$pkgver.tar.gz)
sha256sums=('8a4b81733085d81de1076e2964dedf729a8603941de11659d775478293d9efd0')

build() {
  cd agg-$pkgver
  cargo build --release --locked
}

check() {
  cd agg-$pkgver
  cargo test --all --release --locked
}

package() {
  cd agg-$pkgver
  install -Dm0755 target/release/agg "$pkgdir/usr/bin/agg"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
