# Maintainer  : Willy Micieli <micieli at vivaldi.net>
# Contributor : Willy Micieli <micieli at vivaldi.net>

pkgname=zuu
pkgver=19.1.0
pkgrel=1
pkgdesc="A program to check your code quality before all commit" 
provides=('zuu')
arch=('any')
url="https://github.com/otechdo/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'cargo-deny' 'cargo-audit' 'cargo-auditable')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('00896b953a46e4cf8770e1a5c2456e8ad6bb3150192999da29e4d0faba1d88e0aa0c64603b4f7d5ed7bb0752b2ff1396c4b7dd4526b14507be9fc0a9f7da31e8')

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
