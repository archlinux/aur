# Maintainer  : Willy Micieli <micieli at vivaldi.net>
# Contributor : Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=20.0.0
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=('zuu')
arch=('any')
url="https://github.com/otechdo/zuu"
license=('AGPL-3.0')
makedepends=('cargo')
depends=('rustup' 'cargo-spellcheck' 'cargo-watch' 'cargo-deny' 'cargo-audit' 'cargo-auditable')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('d5744350184de27e10cda0bf9bb160ef90684cd61f11a0220d2086b15b6242b7eaa3e4833b76b475abbd57125c6890317490b9bdcb8c4257b609ef9b6d219c58')

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
