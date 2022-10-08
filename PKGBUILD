# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-settings-git
pkgver=1.0+37+gd172a8b
pkgrel=1
pkgdesc="A settings app for Gnome's Login Manager, GDM"
arch=(any)
url="https://github.com/realmazharhussain/gdm-settings"
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream')
provides=('gdm-settings')
conflicts=('gdm-settings')
backup=()
source=("$pkgname"::"git+$url")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed -e 's/^v//' -e 's/-/+/g'
}
build() {
   arch-meson "$srcdir/$pkgname" build
   meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
