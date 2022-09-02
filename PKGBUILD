# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=1.0+beta.2
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
sha256sums=('de7cdefe9624a1f2d3e00c2badccf1fb5031219f2849ab0a39637c157e451772')

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
