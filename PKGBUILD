# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=2.beta.1
pkgrel=1
arch=(any)
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream')
provides=('gdm-settings')
conflicts=('gdm-settings')
source=("${_pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47ea4230365aad15b841485497e275ddaefcacd1b9d51e7932cbba0325e7bc50')

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
