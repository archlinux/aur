# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=taplo-lsp
pkgver=0.2.5
pkgrel=1
pkgdesc='Language server for Taplo (TOML)'
arch=('x86_64')
url=https://taplo.tamasfe.dev/lsp/
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("taplo-lsp-$pkgver.tar.gz::https://static.crates.io/crates/taplo-lsp/taplo-lsp-$pkgver.crate"
        'https://raw.githubusercontent.com/tamasfe/taplo/master/LICENSE.md')
b2sums=('8c237a08fd3883f9d87927f1b08ba606743d577e9198bab86e37593dc9c22467b99ee74c5f2598090c999158e6db31240bdcef99fa96b03985181ebef07a7315'
        '2b1282c2e1b54a67fd56894ae96a1447d954b52fecdf0730d8c3fe7a95ccf79245e738588a9bda7262eb0ef2507cdeded228346358894d4bbfc540ec90069964')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname ../LICENSE.md
}

# vim:set ts=2 sw=2 et:
