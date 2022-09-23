# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-settings
pkgver=1.0
pkgrel=1
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-settings"
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream')
backup=()
source=("${pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ea34f42062c37f6f83603f6fa043f15d44b39b47fb81e1d9a551cd31fec2e4c')

prepare() {
  cd "$srcdir/$pkgname-${pkgver}"
}
build() {
   arch-meson --buildtype=release "${srcdir}/${pkgname}-${pkgver}" build
   meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
