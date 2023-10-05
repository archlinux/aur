# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=asciinema-agg
pkgver=1.4.3
pkgrel=1
pkgdesc="asciinema gif generator"
arch=(x86_64)
url=https://github.com/asciinema/agg
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo)
source=(https://github.com/asciinema/agg/archive/v$pkgver/agg-$pkgver.tar.gz)
sha256sums=('1089e47a8e6ca7f147f74b2347e6b29d94311530a8b817c2f30f19744e4549c1')

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
