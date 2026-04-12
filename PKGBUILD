# Maintainer: Jory Severijnse <jory@severijnse.eu>
pkgname=rustlock
pkgver=1.1
pkgrel=1
pkgdesc="A high-performance Wayland screen locker written in Rust, inspired by swaylock-effects"
arch=('x86_64')
url="https://github.com/JorySeverijnse/$pkgname"
license=('GPL-3.0-or-later')
depends=('cairo' 'pam' 'gdk-pixbuf2' 'libxkbcommon')
makedepends=('rust' 'cargo' 'pkg-config')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('667b12f67b297d424ac7d7e57ef8a3d4b0b6fa6271eb69f5c36ed9caabc01365')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install PAM configuration
  install -Dm644 "pam.d/rustlock" "$pkgdir/etc/pam.d/rustlock"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
