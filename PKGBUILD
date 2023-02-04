# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=2.1
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2 python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
provides=(gdm-settings)
conflicts=(gdm-settings)
source=("${_pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(d00f5294d90ab755f8a93697d75fec119c1f874aca98d1f65fdbcf29e2cc774e)

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
