# Maintainer: Jonas Grawe <shemneidev at gmail dot com>
# Maintainer: Michael Lohr <michael at lohr dot dev>

pkgname=punktf
pkgver=1.0.0_alpha
pkgrel=1
pkgdesc='A cross-platform multi-target dotfiles manager'
arch=(x86_64)
url='https://github.com/Shemnei/punktf'
license=(MIT)
depends=('gcc-libs')
# Version required for `strip`: '1.45.0-nightly' (https://github.com/rust-lang/rust/issues/72110)
makedepends=(cargo)
source=($pkgname-${pkgver//_/-}.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('f07fcf4e15c8ff6a529e67a091ad892e909e1469f0e8e8f50316661de40ebe39f6d6234a8ad7a842f55d981eeb07ecc57b770407bc96a789f463b958ec9fe97a')
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
