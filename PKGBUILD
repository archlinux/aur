# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=2.6
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
b2sums=('821fc8b3acc0434ec9b0b26ec10e0047765ebcdae6d796f85ec1a81db8a7370ef996310e255ad1d9a90cdab051c360a9cac2aa16f59bc334a509f8fe74031200')

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
