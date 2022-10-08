# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=1.1
pkgrel=1
arch=(any)
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream')
provides=('gdm-settings')
conflicts=('gdm-settings')
source=("${_pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f7f11f9541628c5cfaa0113e5eb5d5fd54b7357f658a78043f962ea0a00d60d')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
}
build() {
   arch-meson "${srcdir}/${_pkgname}-${pkgver}" build
   meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
