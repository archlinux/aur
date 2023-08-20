# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=2.2.1
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
b2sums=('5295253e8347254905b7911a8fc9bab44b953dbed90a9d7211eef651317bd38e6d04a7218cb4c418a7af5223bc53789e866c688cc85239b922d54722a9c055bc')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
