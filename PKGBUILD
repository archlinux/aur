# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-settings
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=2.0
pkgrel=1
arch=(any)
license=('AGPL3')
depends=('gdm' 'libadwaita' 'glib2' 'python-gobject' 'gettext' 'polkit')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream')
source=("${pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd01f3b65e7e13d1bf1e639beda57eeff5916e51404cae358d5ede393d67c84a')

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
