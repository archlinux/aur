# Maintainer: Jonas Grawe <shemneidev at gmail dot com>
# Maintainer: Michael Lohr <michael at lohr dot dev>

pkgname=punktf
pkgver=1.0.0_alpha.1
pkgrel=1
pkgdesc='A cross-platform multi-target dotfiles manager'
arch=(x86_64)
url='https://github.com/Shemnei/punktf'
license=(MIT)
depends=('gcc-libs')
# Version required for `strip`: '1.45.0-nightly' (https://github.com/rust-lang/rust/issues/72110)
makedepends=(cargo)
source=($pkgname-${pkgver//_/-}.tar.gz::$url/archive/refs/tags/v${pkgver//_/-}.tar.gz)
sha512sums=('4a6a22009521fdbd9f65c2a02bdb543103655e5b9aefea639bd69a5486585324737460c0799e211b4322ee38e95a52566c4b8d93feb5f12b2f1fecbaba2e8a70')
provides=('punktf')
conflicts=('punktf')

build() {
  cd $pkgname-${pkgver//_/-}
  cargo build --release --target-dir "target/"
}

package() {
  cd $pkgname-${pkgver//_/-}
  install -D target/release/punktf -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
