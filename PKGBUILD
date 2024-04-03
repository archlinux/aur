# Maintainer  : Willy Micieli <micieli@vivaldi.net>
# Contributor : Willy Micieli <micieli@vivaldi.net>

pkgname=manager
pkgver=0.1.2
pkgrel=1
arch=('x86_64')
pkgdesc="A archlinux setup and manager"
url="https://github.com/otechdo/arch"
depends=('w3m' 'wget' 'rustup' 'git' 'archiso')
makedepends=('cargo')
source=("arch-$pkgver.tar.gz::https://static.crates.io/crates/arch/arch-$pkgver.crate")
provides=('arch')
sha512sums=('5355c0d3757b5e61a3b1465c6ddb5574474ab3f5c6df80cc966d934aacd1f32176eb6329c311924f8924e8bfcdd4414b27748840bda487144af4547e5702b59c')
provides=('arch')
conflicts=('arch')

build() {
  cd arch-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release 
}

package() {
  cd "arch-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/arch/LICENSE"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/arch"
}

