# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=converter
pkgver=1.5.2
pkgrel=1
pkgdesc="Converter is a GTK4+libadwaita application that allows you to convert and manipulate a given image. It is a front-end for ImageMagick."
arch=('any')
url="https://gitlab.com/adhami3310/Converter"
license=('GPL3')
depends=('libadwaita' 'imagemagick' 'ghostscript' 'imath' 'libheif' 'liblqr' 'libjxl' 'openexr' 'python-gobject' 'python-docutils' 'python-svglib' 'python-pymupdf' 'swig' 'webp-pixbuf-loader')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
_commit=e80795836a062156365f95b880aa751399cffff8 # tags/1.5.2^0
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
