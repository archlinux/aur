# Maintainer: Bink
pkgname=memerist
pkgver=0.7.2
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
b2sums=('b52188482ba01b5fc7dc360879a836cccda707fa545ab8dea568eb55d0b87c4b7ab321b70ea0064a94b96f3f8a53e52ad1b51f8d90ba19b6d52ab3312766107d')

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
