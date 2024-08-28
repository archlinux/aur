# Maintainer: Toolybird <toolybird at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.160
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL-2.0-or-later)
depends=(
  cairo
  enchant
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gmime3
  gnutls
  gtk3
  gtkspell3
  hicolor-icon-theme
  pango
  zlib
)
makedepends=(cmake)
source=("https://gitlab.gnome.org/GNOME/pan/-/archive/v$pkgver/pan-v$pkgver.tar.gz")
sha256sums=('6c17f346cbf6d72e0640eb0bc63f9a78a1ca5345eea24d5760a8695e5b3575db')

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
