# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_pkgname=gdm-settings
pkgname=gdm-settings-beta
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://gdm-settings.github.io"
pkgver=5.beta0
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2-devel python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
provides=(gdm-settings)
conflicts=(gdm-settings)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/gdm-settings/gdm-settings/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(ce4061986dc0dce2cf7af92b3a38274f4e2d0b4e203eacc7bfe94ff6f0cfb408)

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
