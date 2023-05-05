# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=1.4.1
pkgrel=1
pkgdesc="A GTK4 + Libadwaita game launcher"
arch=('any')
url="https://github.com/kra-mo/cartridges"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-pyaml')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=(
  "steam: Valve's digital software delivery system"
  'heroic-games-launcher: Native GOG and Epic Games launcher for Linux'
  'bottles: Easily manage wine and proton prefix')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('676a5ecbebef07e7c4d6b1b3f940c4c70e900287e7439344dd8b601c6d67bab053b432e5916ccb0ca2f359e75f04966d951def58720a1c5ab941991bc189d3e9')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
