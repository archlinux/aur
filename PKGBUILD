# Maintainer: Bink
pkgname=memerist
pkgver=2.4.1
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
b2sums=('953077a6994b3376742c281ceeeb34057ba6497c3f8885e611af52870219eee8bef80d4431dd6cbd1a72a1193df60805bca86783aba26cc7ca410ac005a24aa6')

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
