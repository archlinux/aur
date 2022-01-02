# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=taplo-lsp
pkgver=0.2.6
pkgrel=1
pkgdesc='Language server for Taplo, a TOML toolkit'
arch=('x86_64')
url=https://taplo.tamasfe.dev/lsp/
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("taplo-lsp-$pkgver.tar.gz::https://static.crates.io/crates/taplo-lsp/taplo-lsp-$pkgver.crate"
        "taplo-lsp-$pkgver-LICENSE.md::https://raw.githubusercontent.com/tamasfe/taplo/release-lsp-$pkgver/LICENSE.md")
b2sums=('fd9f0d851957df3b05f50c9366bfbf6c16c05b9585c8bf68256ea385779cdf0e70241f0195a8b3b4f1b8b94e84422bc23fc834cad5c54e10f9b961fdaf7b7aac'
        '2b1282c2e1b54a67fd56894ae96a1447d954b52fecdf0730d8c3fe7a95ccf79245e738588a9bda7262eb0ef2507cdeded228346358894d4bbfc540ec90069964')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 ../taplo-lsp-$pkgver-LICENSE.md \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}

# vim:set ts=2 sw=2 et:
