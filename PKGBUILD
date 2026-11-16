# Maintainer: Bink
pkgname=memerist
pkgver=2.6.1
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
b2sums=('30cbca36b452382ad7cb39251b2b99de93a86e715adf49458530e001dc4fc137c3be9aff64a33b2d77dc72fca7711aea85ea3ae016c5696cc7306b6500f84fe5')

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
