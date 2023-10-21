# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://gdm-settings.github.io"
pkgver=4.0
pkgrel=0
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2 python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
provides=(gdm-settings)
conflicts=(gdm-settings)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/gdm-settings/gdm-settings/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(8cef838aad5b0b6d75b418f91398407a4a9ceabf5a2b188fb940b73711fcf1c2)

build() {
   arch-meson "${srcdir}/${_pkgname}-${pkgver}" build
   meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
