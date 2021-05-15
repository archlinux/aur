# Maintainer: Dimitri Merejkowsky <d.merej at gmail>
pkgname=rusync
pkgver="0.7.0"
pkgrel=1
pkgdesc="Ergonomic replacement for rsync"
url="https://git.sr.ht/~dmerej/rusync"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("rusync-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('72eb3c710e2c17e3e8999c904e6abf276a78861e1cbfc5aad00b1622aa2bda7b')

build() {
  cd rusync-v$pkgver
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd rusync-v$pkgver
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --all-features --target-dir=target
}

package() {
  cd rusync-v$pkgver
  install -Dm755 target/release/rusync "${pkgdir}/usr/bin/rusync"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/rusync/LICENSE
}

# vim:set ts=2 sw=2 et:
