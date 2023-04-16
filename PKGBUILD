# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=1.4
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
b2sums=('6f81f2bfb180af57023da546c45be454ab6f9637191feb4310badabe0a84e42b7ca062c620bfd059a37dd23ab83f7ae6569cf7d7fb9b8cfeec64c196ed3c2b42')

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
