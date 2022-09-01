# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=1.0+beta.1
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
sha256sums=('a23733778d19821f9c41d09512406528b77c021924e7ae840549b18d675fc005')

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
