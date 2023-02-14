# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges
pkgver=0.1.2
pkgrel=2
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
b2sums=('3584cc812047082a4dc3abdfffab922699865c46f3289aa78e20e270fde9b9c1b754c2f5473251880d81d190652622454e1786fd5a0896cc375b63b6475bb78c')

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
