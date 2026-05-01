# Maintainer: Essem <smswessem@gmail.com>

pkgname=nip4
pkgver=9.1.2
pkgrel=1
pkgdesc="image processing spreadsheet"
arch=('x86_64')
url="https://github.com/libvips/nip4"
license=('MIT')
depends=(
  'cairo'
  'dconf'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gsl'
  'gtk4'
  'hicolor-icon-theme'
  'libvips'
  'libxml2'
  'pango'
)
makedepends=(
  'meson'
  'cmake'
  'glib2-devel'
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('40a627bf6046965d800b1dd44b6c30d37f0ab15c413cb1dc6150cd72dbd48179')

build() {
  meson setup build $pkgname-$pkgver --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"

  cd "${pkgbase}-${pkgver}"
  install -Dm 644 LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
