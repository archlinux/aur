# Maintainer: Jonas Grawe <shemneidev at gmail dot com>
# Maintainer: Michael Lohr <michael at lohr dot dev>

pkgname=punktf
pkgver=1.0.2
pkgrel=1
pkgdesc='A cross-platform multi-target dotfiles manager'
arch=(x86_64)
url='https://github.com/Shemnei/punktf'
license=('MIT' 'Apache')
depends=('gcc-libs')
# Version required for `strip`: '1.45.0-nightly' (https://github.com/rust-lang/rust/issues/72110)
makedepends=(cargo)
source=($pkgname-${pkgver//_/-}.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('0dc069a118ff1fa87efce75e7ecc35c8a047721146c23d2830ead72fb963f9f4d1ff81973074b0d64a615f5b53dc7a84c4714fda6e4587582f26905ec23c8c1a')
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
  install -Dm 644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 LICENSE-APACHE -t "$pkgdir"/usr/share/licenses/$pkgname
}
