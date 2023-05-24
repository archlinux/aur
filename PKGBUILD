# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=converter
pkgver=1.6.1
pkgrel=1
pkgdesc="Converter is a GTK4+libadwaita application that allows you to convert and manipulate a given image. It is a front-end for ImageMagick."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/adhami3310/Converter"
license=('GPL3')
depends=('libadwaita' 'imagemagick')
makedepends=('git' 'blueprint-compiler' 'meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname::git+$url.git#tag=v$pkgver)
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
