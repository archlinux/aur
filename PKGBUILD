# Maintainer  : Willy Micieli <micieli at vivaldi.net>
# Contributor : Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=17.0.0
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=('zuu')
arch=('any')
url="https://github.com/otechdo/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'cargo-audit' 'cargo-auditable')
optdepends=('git: git support' 'mercurial: mercurial support')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('4603bd0f87f62afef1cb223bb5930f21457115bc13a7bc169c62cc9d9eeec211')

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release 
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  #install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
