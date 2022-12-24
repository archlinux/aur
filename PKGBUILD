# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag-git
pkgver=0.3.0.r1.g5959d7b
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://github.com/knuxify/eartag"
license=('MIT')
depends=('libadwaita' 'python-gobject' 'python-pillow' 'python-mutagen' 'python-magic')
makedepends=('git' 'meson')
checkdepends=('appstream-glib' 'python-pytest')
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
