# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-settings
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://gdm-settings.github.io"
_commit=4202ec8d716bae7e84298deaa16e2129dc1bebfe
pkgver=4.0+r2+4202ec8
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2 python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
#source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/gdm-settings/gdm-settings/archive/refs/tags/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/gdm-settings/gdm-settings/archive/${_commit}.tar.gz")
sha256sums=(4c05c1dbeac31310f3750d776f4705d7e7f21263329f48dbf0a404510fc3bf4b)

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
