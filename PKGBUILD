# Maintainer: nlion <nlion@nlion.nl>
pkgname=arch-manwarn
pkgver=1.4.1
pkgrel=1
pkgdesc="Rust-based pacman hook that blocks updates if unread Arch News posts require manual intervention"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'i686')
url="https://github.com/NLion74/arch-manwarn"
license=('LicenseRef-UNLICENSE')
depends=('pacman' 'curl')
conflicts=('informant')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d74d544969231bb5c2ca2cee50eaf82cfcf307593bab4b7a88a33bb3b71f4df')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/arch-manwarn" "$pkgdir/usr/bin/arch-manwarn"
  install -Dm644 "hooks/00-arch-manwarn.hook" "$pkgdir/usr/share/libalpm/hooks/00-arch-manwarn.hook"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "man/arch-manwarn.1" "$pkgdir/usr/share/man/man1/arch-manwarn.1"
}
