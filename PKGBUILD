# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=converter-git
pkgver=1.2.0.r4.g5872417
pkgrel=1
pkgdesc="Converter is a GTK4+libadwaita application that allows you to convert and manipulate a given image. It is a front-end for ImageMagick."
arch=('any')
url="https://gitlab.com/adhami3310/Converter"
license=('GPL3')
depends=('libadwaita' 'imagemagick' 'python-gobject' 'python-svglib' 'python-pymupdf' 'swig')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
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
