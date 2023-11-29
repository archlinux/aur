# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=hexdino-git
_name=hexdino
pkgver=r223.d136ee2
pkgrel=1
pkgdesc="A hex editor with vim like keybindings written in Rust."
arch=('x86_64' 'i686')
url="https://github.com/Luz/hexdino"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('hexdino')
conflicts=('hexdino')
options=(!emptydirs !strip)
source=('git+https://github.com/Luz/hexdino')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  cargo build --release
}

package() {
  cd "$srcdir/$_name"
  mkdir -p "$pkgdir/usr/bin"
  install -o root -g root -m 755 target/release/hexdino "$pkgdir/usr/bin"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
