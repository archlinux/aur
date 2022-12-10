# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=converter
pkgver=1.4.0
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
_commit=a16923f922441820a4b8a0f639bd935d6d3cffd4 # tags/1.4.0^0
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
