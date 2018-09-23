# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader-beta
pkgver=3.2.99
pkgrel=2
pkgdesc="A graphical frontend to tesseract-ocr, beta version"
arch=('i686' 'x86_64')
url="https://github.com/manisandro/gImageReader/"
license=('GPL3')
depends=(gtksourceviewmm libxml++2.6 sane podofo tesseract gtkspellmm poppler-glib djvulibre libzip libjpeg libxml++ cairomm json-glib libxml2 python-gobject)
makedepends=(desktop-file-utils intltool cmake)
provides=(gimagereader)
conflicts=(gimagereader)
source=("https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${pkgname%-*}-${pkgver}.tar.xz")
sha256sums=('e6a45d1a7a3b83ed7fa8181b886dd28e1bb8c5935cc0ac62f1c4f12cb51b4fc2')

prepare() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  mkdir build
}
build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}/build"
  cmake -DINTERFACE_TYPE=gtk \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}/build"
  make DESTDIR="$pkgdir"/ install
}
