# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges-git
pkgver=0.1.2.r16.g1acca57
pkgrel=1
pkgdesc="A GTK4 + Libadwaita game launcher"
arch=('any')
url="https://github.com/kra-mo/cartridges"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-pyaml')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=(
  "steam: Valve's digital software delivery system"
  'heroic-games-launcher: Native GOG and Epic Games launcher for Linux'
  'bottles: Easily manage wine and proton prefix')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
