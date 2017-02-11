# Maintainer: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.2.1
pkgrel=1
pkgdesc="A graphical frontend to tesseract-ocr"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gimagereader/"
license=('GPL3')
depends=('gtksourceviewmm' 'hicolor-icon-theme' 'libxml++2.6' 'sane' 'podofo' 'tesseract' 'gtkspellmm')
#depends=('hicolor-icon-theme' 'sane' 'tesseract' 'qtspell' 'poppler-qt4')
makedepends=('desktop-file-utils' 'intltool' 'poppler-glib' 'cmake')
#makedepends=('desktop-file-utils' 'intltool')
install=${pkgname}.install
source=(
  "https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=('8dc08ca6f36f4c226203fa7fdb2709953d69309dcc78263621231d89d1c1c26e')

build() {
  cd "$pkgname-$pkgver"

  mkdir build
  cd build 

  cmake -DINTERFACE_TYPE=gtk -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd "$pkgname-$pkgver"/build
  make DESTDIR="$pkgdir"/ install
}
