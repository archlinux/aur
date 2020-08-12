# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=akira
pkgver=0.0.12
pkgrel=1
pkgdesc='Native Linux App for UI and UX Design built in Vala and Gtk'
arch=('x86_64' 'aarch64')
url="https://github.com/akiraux/${pkgname^}"
license=('GPL3')
depends=('elementary-icon-theme'
         'goocanvas'
         'gtk-theme-elementary'
         'gtksourceview3'
         'libarchive'
         'granite')
makedepends=('appstream'
             'meson'
             'vala')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1fd59caf8d4d32934552ac643fca5f31fe9365ae46080d9bb2fac88e73c0faed')

build() {
  cd "${pkgname^}-$pkgver"
  meson build --prefix /usr
  ninja -C build
}

package() {
  cd "${pkgname^}-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
  pushd $pkgdir/usr/bin
  ln -s com.github.akiraux.akira akira
}
