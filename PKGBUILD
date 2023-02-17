# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag-git
pkgver=0.3.2.r0.gb0fcc50
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://gitlab.gnome.org/knuxify/eartag"
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
