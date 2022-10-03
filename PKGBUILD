# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pinapp
_pkgname=PinApp
pkgver=1.1.1
_commit=077c1fe5b1c2fdf38ec66f566583e79a9b9e4d1f
pkgrel=1
pkgdesc="Create your own application shortcuts"
arch=('x86_64' 'aarch64')
url="https://github.com/fabrialberio/PinApp"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=(git+$url.git#commit=${_commit})
b2sums=('SKIP')

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