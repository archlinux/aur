# Maintainer: Gauthier Billot <gogoprog@gmail.com>

pkgname=termpicv-git
_pkgname=termpicv
pkgver=r5.d5bc292
pkgrel=1
pkgdesc="Terminal image browser with a thumbnail grid and viewer, displayed through ueberzug"
arch=('x86_64' 'aarch64')
url="https://github.com/gogoprog/termpicv"
license=('MIT')
depends=('ncurses' 'imagemagick' 'libpng' 'ueberzug' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
