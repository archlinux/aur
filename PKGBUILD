# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=converter
pkgver=1.5.0
pkgrel=1
pkgdesc="Converter is a GTK4+libadwaita application that allows you to convert and manipulate a given image. It is a front-end for ImageMagick."
arch=('any')
url="https://gitlab.com/adhami3310/Converter"
license=('GPL3')
depends=('libadwaita' 'imagemagick' 'ghostscript' 'imath' 'libheif' 'liblqr' 'libjxl' 'openexr' 'python-gobject' 'python-docutils' 'python-svglib' 'python-pymupdf' 'swig' 'webp-pixbuf-loader')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_commit=2c5b0c9c250078ca5b84f2f2609da81c4ab96ddb # tags/1.5.0^0
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
