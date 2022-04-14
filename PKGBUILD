# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gdm-settings-git
pkgver=0.4+70+g4a18211
pkgrel=1
epoch=1
pkgdesc="A settings app for Gnome's Login Manager (GDM)"
arch=(any)
url="https://github.com/realmazharhussain/gdm-settings"
license=('AGPL3')
depends=('libadwaita' 'glib2' 'python-gobject' 'gettext')
makedepends=('git' 'meson' 'blueprint-compiler-git' 'gobject-introspection')
checkdepends=('appstream-glib')
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
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir="$pkgdir"
}
