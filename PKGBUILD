# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pinapp-git
_pkgname=PinApp
pkgver=1.1.4.r0.g640af9a
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('any')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

