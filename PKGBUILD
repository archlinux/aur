# Maintainer: Toolybird <toolybird at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.161
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL-2.0-or-later)
depends=(
  cairo
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gmime3
  gnutls
  gspell
  gtk3
  hicolor-icon-theme
  pango
  zlib
)
makedepends=(cmake)
source=("https://gitlab.gnome.org/GNOME/pan/-/archive/v$pkgver/pan-v$pkgver.tar.gz")
sha256sums=('0b3bcf749947d4af9fa9ab0d6a0e2d1c4d7a8f6c6d6c9103afda379a6039ca5e')

build() {
  cmake -B build -S pan-v$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
