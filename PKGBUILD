# Maintainer: Dimitri Merejkowsky <dimitri@dmerej.info>
pkgname=ruplacer
pkgver="0.6.2"
pkgrel=1
pkgdesc="Find and replace text in source files"
url="http://github.com/TankerHQ/ruplacer"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("ruplacer-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('54533bb5ee33a5580f6d1160e92f4adf436350937dd2705de14ed9af185ee875')

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
