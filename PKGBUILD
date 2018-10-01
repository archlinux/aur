# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.3.0
pkgrel=1
pkgdesc="A graphical frontend to tesseract-ocr"
arch=(i686 x86_64)
url="https://github.com/manisandro/gImageReader/"
license=(GPL3)
depends=(gtksourceviewmm libxml++2.6 sane podofo tesseract gtkspellmm poppler-glib djvulibre libzip python-gobject)
makedepends=(desktop-file-utils intltool cmake)
source=("https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('91615af41e89170aadaae68cb0db94eb62abdd5b308e8a5162477ba9baf6efe9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DINTERFACE_TYPE=gtk \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir"/ install
}
