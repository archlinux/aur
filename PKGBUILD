# Maintainer: Bink
pkgname=memerist
pkgver=2.6.0
pkgrel=1
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
b2sums=('ba7ceddc455100c899b219066584fc83e379456646ae379d9c022ee08608f8aa6997fce27bf03c31409c1e87d377bcd2e2b003e7a400678aaff595ed5885d5a3')

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
