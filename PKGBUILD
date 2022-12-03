# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=2.0
pkgrel=1
arch=(any)
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream')
provides=('gdm-settings')
conflicts=('gdm-settings')
source=("${_pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd01f3b65e7e13d1bf1e639beda57eeff5916e51404cae358d5ede393d67c84a')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
}
build() {
   arch-meson --buildtype=release "${srcdir}/${_pkgname}-${pkgver}" build
   meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
