# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=converter-git
pkgver=1.5.0.r0.g2c5b0c9
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
