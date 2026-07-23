# Maintainer: Bink
pkgname=memerist
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern meme editor built with GTK 4 and Libadwaita"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/memerist"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'imagemagick'
  'libadwaita'
  'libepoxy'
  'libjpeg-turbo'
  'libpng'
)
makedepends=(
  'blueprint-compiler'
  'gcc'
  'meson'
  'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a1390d3ffdd5ebe3f386f7b895c391d13d35d30bc80e5d813000bc8f443c0a888699b987250e5de0e5dab8ccfaae0e78f3020aec61b8941b4f25e1a99fda75d8')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup build \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nodownload
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
