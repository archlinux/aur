# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=2.7.1
pkgrel=1
pkgdesc="A GTK4 + Libadwaita game launcher"
arch=(any)
url="https://github.com/kra-mo/cartridges"
license=(GPL3)
depends=(gtk4 libadwaita gdk-pixbuf2 gobject-introspection-runtime python python-gobject python-requests python-yaml
         python-pillow python-urllib3 dconf hicolor-icon-theme)
makedepends=(blueprint-compiler meson)
checkdepends=(appstream-glib)
optdepends=("steam: Valve's digital software delivery system"
            'heroic-games-launcher: Native GOG and Epic Games launcher for Linux'
            'bottles: Easily manage wine and proton prefix')
source=(${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz)
b2sums=('a1ba5563bb084b0ba44660f8cfd17fa576fadf0371d42ca9c539c5093064f66141829962e736a2eed3d8a8de4eb940ecf0c33cd89880daebc36b12787af9450d')

build() {
  arch-meson "${pkgname}-${pkgver}" build  -D tiff_compression=jpeg
  meson compile -C build
}

check() {
  # https://github.com/kra-mo/cartridges/issues/206
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
