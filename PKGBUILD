# Maintainer  : Willy Micieli <micieli@vivaldi.net>
# Contributor : Willy Micieli <micieli@vivaldi.net>

pkgname=oh
pkgver=0.0.1
pkgrel=1
arch=('x86_64')
pkgdesc="A archlinux setup and manager"
url="https://github.com/otechdo/oh"
depends=('w3m' 'wget' 'rustup' 'git' 'archiso')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/arch/$pkgname-$pkgver.crate")
sha512sums=('5355c0d3757b5e61a3b1465c6ddb5574474ab3f5c6df80cc966d934aacd1f32176eb6329c311924f8924e8bfcdd4414b27748840bda487144af4547e5702b59c')
provides=('oh' 'os')

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release 
}

package() {
  cd "$pkgname-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
