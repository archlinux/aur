# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=1.0+beta.4
_pkgver=${pkgver/+/-}
pkgrel=1
arch=(any)
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream')
provides=('gdm-settings')
conflicts=('gdm-settings')
source=("${_pkgname}-${_pkgver}.tar.gz"::"$url/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('c7a85508ba87dea03663a319f6893bbbcba4c2483438755e694d581105a6a5b7')

prepare() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
}
build() {
   arch-meson "${srcdir}/${_pkgname}-${_pkgver}" build
   meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
