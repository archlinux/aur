# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=1.5
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
b2sums=('4b9aee31e129e83378ba34b9963d28f0c8766c61540d770cbefefb31b2e14a0fdd2e2f1d8655bc9fa28714dd3113221d087caca329e62b0b9826240677c328aa')

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
