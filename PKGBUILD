# Maintainer: Bink
pkgname=memerist
pkgver=2.5.0
pkgrel=2
pkgdesc="A simple and modern meme editor"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/memerist"
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk4'
  'imagemagick'
  'libadwaita'
  'libepoxy'
  'pango'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('19b2f9193629ccb44d2f398f0a5fa1e46dd9dee5cfaf2c3241de5ffc8103571d0ace49e3bea9a328bec08b700cb61a98db79231a752a5cf6810eaca30d3ed157')

build() {
  cd "${pkgname}-${pkgver}" || exit
  meson setup build \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nodownload
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  meson install -C build --destdir="${pkgdir}"
}
