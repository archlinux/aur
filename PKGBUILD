# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=qt-jpegxl-image-plugin-git
_pkgname=${pkgname%-git}
pkgver=r36.6a77371
pkgrel=1
pkgdesc='Qt plug-in to allow Qt and KDE based applications to read/write JXL images'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'libjxl')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./build_libqjpegxl_dynamic.sh
}

package() {
  cd "$_pkgname"
  make install INSTALL_ROOT="$pkgdir"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
