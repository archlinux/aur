# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=akira
pkgver=0.0.1a
pkgrel=2
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
sha256sums=('0d1c817862e324db3f425c30f565565df18ee352e9e02530962d79d4a2c9e7f0')

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
