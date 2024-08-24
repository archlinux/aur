# Maintainer  : Willy Micieli <micieli at vivaldi.net>
# Contributor : Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=20.0.1
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=('zuu')
arch=('any')
url="https://github.com/otechdo/zuu"
license=('AGPL-3.0')
makedepends=('cargo')
depends=('rustup' 'cargo-outdated' 'cargo-spellcheck' 'cargo-watch' 'cargo-deny' 'cargo-audit' 'cargo-auditable')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('dd1ddd64ccaec5f3e901042ca7a94aa4f840d70d4635d50c17b80dd6d64282e18f36cc9a5407dce14ced240cef35bfa49323fa4817f7d23ab69f1dee573c4bcc')

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
  install -Dm644 *.1 -t "$pkgdir/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
