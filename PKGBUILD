# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-settings
__pkgver='0.6'
pkgver=${__pkgver/-/+}
pkgrel=1
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-settings"
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
backup=()
source=("${pkgname}-${__pkgver}.tar.gz"::"$url/archive/refs/tags/v${__pkgver}.tar.gz")
sha256sums=('a8300b4992e4080c454a5cf4dd0d50c90a0f452ba3059619e443de9ee9f465a0')

prepare() {
  cd "$srcdir/$pkgname-${__pkgver}"
}
build() {
   arch-meson --buildtype=release "${srcdir}/${pkgname}-${__pkgver}" build
   meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
