# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=3.1
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2 python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
provides=(gdm-settings)
conflicts=(gdm-settings)
source=("${_pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(7a62c7d5c6d6caea4d4dfd6b446c43f55c9f3f2cbc1f41a2dc7d8a782d494e89)

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
