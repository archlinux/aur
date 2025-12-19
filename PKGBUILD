# Maintainer: Essem <smswessem@gmail.com>

pkgname=vipsdisp
pkgver=4.1.3
pkgrel=1
pkgdesc="Tiny libvips / gtk+4 image viewer"
arch=('x86_64')
url="https://github.com/jcupitt/vipsdisp"
license=('MIT')
depends=(
  'cairo'
  'dconf'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libvips'
)
makedepends=(
  'meson'
  'cmake'
  'glib2-devel'
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('4e3dbd72f8f56e0216045ef36b5097d00b3d14f2608cf856f0ecbab3d4c44ba4')

build() {
  meson setup build $pkgname-$pkgver --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"

  cd "${pkgbase}-${pkgver}"
  install -Dm 644 LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
