# Maintainer: Jonas Grawe <shemneidev at gmail dot com>
# Maintainer: Michael Lohr <michael at lohr dot dev>

pkgname=punktf
pkgver=1.0.0
pkgrel=1
pkgdesc='A cross-platform multi-target dotfiles manager'
arch=(x86_64)
url='https://github.com/Shemnei/punktf'
license=(MIT)
depends=('gcc-libs')
# Version required for `strip`: '1.45.0-nightly' (https://github.com/rust-lang/rust/issues/72110)
makedepends=(cargo)
source=($pkgname-${pkgver//_/-}.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
sha512sums=('8f3767f1d9fd36c6c4aeba6e3ba36200ae397ca60d80e21fad605b500707e72415f3276eb5928233db5d09855dc3e8cb8207af1b21904a3b49eae80a7552a76f')
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
