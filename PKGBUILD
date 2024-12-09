# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-settings
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://gdm-settings.github.io"
pkgver=5.0
pkgrel=1
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2-devel python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/gdm-settings/gdm-settings/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(adfc33250589217531e9fa679cad03cbe7c845b39fb99fcc226329453ce0ac40)

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
