# Maintainer: ...

pkgname=rumoca
pkgver=0.9.20
pkgrel=1
pkgdesc="A rust-native Modelica compiler for fast, composable, scientific computing"
url="https://github.com/CogniPilot/rumoca"
license=('Apache-2.0')
arch=('x86_64')
makedepends=('cargo')
depends=('glibc' 'libgcc' 'xz' 'bzip2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CogniPilot/rumoca/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c83f304aaf121d589286d0a7276b82b81318e0e0e4d64d5e9a688488b0137496')

prepare() {
  cd "$pkgname-$pkgver"
  rm -f rust-toolchain.toml
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked -p rumoca -p rumoca-tool-lsp ${MAKEFLAGS}
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rumoca "$pkgdir/usr/bin/rumoca"
  install -Dm755 target/release/rumoca-lsp "$pkgdir/usr/bin/rumoca-lsp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
