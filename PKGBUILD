# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-st
pkgver=0.10.3
pkgrel=2
pkgdesc="Simple terminal emulator for X with some patches applied"
url="https://github.com/archy-linux/$pkgname"
arch=('i686' 'x86_64')
license=('MIT')
options=()
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'harfbuzz')
makedepends=('make' 'gzip' 'ncurses')
install=
provides=(st)
source=("https://github.com/archy-linux/$pkgname/archive/refs/tags/$pkgname_$pkgver.tar.gz")
sha256sums=('f3d05c52c7dbdb6b39cf16d12ba5d5b9da5e19370045687041ad6d32c6757ca6')

build() {
  cd "$pkgname-$pkgver" || exit 1
  make -j
  gzip st.1
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  # shellcheck disable=SC2154
  install -Dm755 st "$pkgdir/usr/bin/st"
  install -Dm644 st.1.gz "$pkgdir/usr/share/fan/man1/st.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  # install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
}
