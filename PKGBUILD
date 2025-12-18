# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-st-git
_pkgname=archy-st
pkgver=0.10.3.r0.g7775631
pkgrel=1
pkgdesc="Simple terminal emulator for X with some patches applied"
url="https://github.com/archy-linux/$_pkgname"
arch=('i686' 'x86_64')
license=('MIT')
options=()
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'harfbuzz')
makedepends=('make' 'gzip' 'ncurses' 'git')
install=
provides=(st)
conflicts=('archy-st')
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname" || exit 1
  make -j
  gzip st.1
}

package() {
  cd "$_pkgname" || exit 1
  # shellcheck disable=SC2154
  install -Dm755 st "$pkgdir/usr/bin/st"
  install -Dm644 st.1.gz "$pkgdir/usr/share/fan/man1/st.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  # install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
}
