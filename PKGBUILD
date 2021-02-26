# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo-git
pkgver=1.17.4
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
depends=(lzo zlib libpng fontconfig freetype2 libx11 libxext libxrender libxcb
         glib2 pixman)
makedepends=(valgrind git meson)
provides=(cairo)
conflicts=(cairo)
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git")
sha256sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson cairo build \
    -D spectre=disabled \
    -D tee=enabled \
    -D quartz=disabled \
    -D symbol-lookup=disabled \
    -D tests=disabled
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
