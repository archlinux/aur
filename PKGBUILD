# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=qt-jpegxl-image-plugin-git
_pkgname=${pkgname%-git}
pkgver=r20.64d8341
pkgrel=1
pkgdesc='Qt plug-in to allow Qt and KDE based applications to read/write JXL images'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'libjpeg-xl')
makedepends=('git' 'make')
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
  install -Dm755 "$srcdir/$_pkgname/plugins/imageformats/libqjpegxl.so" "$pkgdir/usr/lib/qt/plugins/imageformats/libqjpegxl.so"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
