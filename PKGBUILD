# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gdm-settings
pkgdesc="A settings app for Gnome's Login Manager, GDM"
url="https://github.com/realmazharhussain/gdm-settings"
pkgver=3.0
pkgrel=0
arch=(any)
license=(AGPL3)
depends=(gdm libadwaita glib2 python-gobject gettext polkit)
makedepends=(meson blueprint-compiler gobject-introspection)
checkdepends=(appstream)
source=("${pkgname}-${pkgver}.tar.gz"::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(e4b33b8506383fea7bda7dd354183bc18e19355080cd0f4899d973a43717332f)

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
