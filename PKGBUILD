# Maintainer: Bink
pkgname=memerist
pkgver=0.7.0
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
sha256sums=('166069adabf7202d63fff305e5313db2ee05ac0121b759a6dc12405dae2c0b97')
b2sums=('7c1d6a1145a988d1c1d00b4aab3560567b485c7e386bab80e17c2b8ad9098c8bc915fe085ec07c003e2fc8d01cb6e04b1266f9563808369d1513b264d4b5ca02')

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
