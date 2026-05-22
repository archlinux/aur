# Maintainer: Bink
pkgname=memerist
pkgver=0.8.0
pkgrel=1
pkgdesc="A modern meme editor built with GTK 4 and Libadwaita"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/memerist"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'libadwaita'
  'libepoxy'
  'libjpeg'
  'libpng'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e5d3f8a00d0ca28600e5d1277052e78d0b7cbcb892b6bdcffc7b36e4dea2088e78c31d395d6740b4f8df3e16d0dd22347d5872b39803373f3ba6970022ec7168')

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
