# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=2.7.4
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
b2sums=('0f15bbe53d8a893dd22b54b0b9435e8a301536c3654b99a302622655dc1207dc657ec21f9c0b8bb7526465126e62d86f7b35ce5561ccf0c275282ce04b685a44')

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
