# Maintainer:

pkgname=gxml
pkgver=0.18.1
pkgrel=1
pkgdesc="GObject-based XML parser and writer library"
arch=('x86_64')
url="https://wiki.gnome.org/GXml"
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('bac5bc82c39423c1dbbfd89235f4a9b03b69cfcd3188905359ce81747b6400ed')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
