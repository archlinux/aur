# Maintainer: Jory Severijnse <jory@severijnse.eu>
pkgname=rustlock
pkgver=0.1.0
pkgrel=1
pkgdesc="A high-performance Wayland screen locker written in Rust, inspired by swaylock-effects"
arch=('x86_64')
url="https://github.com/JorySeverijnse/rustlock"
license=('AGPL3')
depends=('cairo' 'pam' 'gdk-pixbuf2' 'libxkbcommon')
makedepends=('rust' 'cargo' 'pkg-config')
source=("git+https://github.com/JorySeverijnse/rustlock.git")
sha256sums=('3475c412e118c21d8a51b50f439b58267fc784e18a15edfc9f95a4f24ecd9038')

build() {
  cd "$pkgname"
  cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install PAM configuration
  install -Dm644 "pam.d/wayrustlock" "$pkgdir/etc/pam.d/rustlock"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
