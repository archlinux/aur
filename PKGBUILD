# Maintainer: asafelobotomy
# Source build of a tagged release. `updpkgsums` fills the checksum at release time.
pkgname=bindaru
pkgver=0.1.0
pkgrel=1
pkgdesc='pacman and AUR package store for uQ, with a visible AUR review gate'
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/bindaru'
license=('GPL-3.0-or-later')
depends=('pacman' 'polkit' 'git' 'base-devel' 'curl' 'qt6-declarative' 'kirigami')
makedepends=('cargo' 'clang')
optdepends=('uq: the Software page in uQ Settings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6dddd62fec48f20febf484a83a98127b5fef324fde318db25ae9b9e5576b1744')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --workspace
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" scripts/install-files.sh
}
