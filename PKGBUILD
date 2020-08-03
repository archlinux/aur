# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=akira
pkgver=0.0.1
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
             'git'
             'meson'
             'vala')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6f28ee7061c6842846c80a8a5111111edc8efd206767a1ac0b0c9c59a3cf3851')

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
