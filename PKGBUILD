# Maintainer: Dimitri Merejkowsky <dimitri@dmerej.info>
pkgname=ruplacer
pkgver="0.6.0"
pkgrel=1
pkgdesc="Find and replace text in source files"
url="http://github.com/TankerHQ/ruplacer"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("ruplacer-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ebc53206d3042291137517cfc2729ed7c774b95fca0e2553427e70da6d73cbf0')

build() {
  cd ruplacer-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd ruplacer-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --all-features --target-dir=target
}

package() {
  cd ruplacer-$pkgver
  install -Dm755 target/release/ruplacer "${pkgdir}/usr/bin/ruplacer"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/ruplacer/LICENSE
}
