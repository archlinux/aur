# Maintainer: Bink
pkgname=memerist
pkgver=0.9.0
pkgrel=2
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
  'libjpeg'
  'libpng'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c9022ea48947a2e0b53c0acf7f7cd99658f04d1fa029997972834eb83a2f871c484af8938fe3ee7930df1a89afb8c54283c031a7943cae5d5fd7e0f54097ddb4')

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
