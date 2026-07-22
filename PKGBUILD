# Maintainer: a77ila
pkgname=pactience
pkgver=0.1.0
pkgrel=1
pkgdesc="Enforce a minimum package age before upgrading Arch Linux packages (pacman/AUR)"
arch=('x86_64' 'aarch64')
url="https://github.com/a77ila/pactience"
license=('MIT' 'Apache-2.0')
depends=('pacman' 'gcc-libs' 'zlib')
makedepends=('cargo')
optdepends=(
  'paru: AUR package support'
  'yay: AUR package support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/a77ila/pactience/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70161ea667460eb7d606c8b6e7551a6bf35df122c3ff67a7e56c04affe2d43dd')

build() {
  cd "$pkgname-$pkgver/src"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver/src"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver/src"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 ../LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
