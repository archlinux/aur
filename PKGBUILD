# Maintainer: Jonas Grawe <shemneidev at gmail dot com>
# Maintainer: Michael Lohr <michael at lohr dot dev>

pkgname=punktf
pkgver=1.0.1
pkgrel=1
pkgdesc='A cross-platform multi-target dotfiles manager'
arch=(x86_64)
url='https://github.com/Shemnei/punktf'
license=(MIT)
depends=('gcc-libs')
# Version required for `strip`: '1.45.0-nightly' (https://github.com/rust-lang/rust/issues/72110)
makedepends=(cargo)
source=($pkgname-${pkgver//_/-}.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('5f412821c246ea4cab220f6d9e44f691e03864b37a98ab5b9b1d96fe6e48e566b9ce654d06601412acc5632c4dec32eb97a6b754d79a6edd86b18775f2850986')
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
