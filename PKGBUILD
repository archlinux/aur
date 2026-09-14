# Maintainer: Bink
pkgname=memerist
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple meme editor for Linux"
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
b2sums=('7747043be161e5f6dfae855542f6b2d8953f97467691e0f3a6bcbbeacf54739cb8585619b5f90d6f3d9e81a9657bccfa2df7505b54caeb51159f8f5c2d9e48ee')

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
