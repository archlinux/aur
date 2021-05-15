# Maintainer: Dimitri Merejkowsky <d.merej at gmail>
pkgname=rusync
pkgver="0.4.0"
pkgrel=1
pkgdesc="Ergonomic replacement for rsync"
url="http://github.com/dmerejkowsky/rusync"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("rusync-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('79bb60b5d33f4ab30826ba3de2bcbadbf51bd9a6d7c927a5f26ab1839de9ec77')

build() {
  cd rusync-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd rusync-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --all-features --target-dir=target
}

package() {
  cd rusync-$pkgver
  install -Dm755 target/release/rusync "${pkgdir}/usr/bin/rusync"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/rusync/LICENSE
}

# vim:set ts=2 sw=2 et:
