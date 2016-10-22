# Maintainer: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.1.99
pkgrel=1
pkgdesc="A graphical frontend to tesseract-ocr"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gimagereader/"
license=('GPL3')
depends=('gtksourceviewmm' 'hicolor-icon-theme' 'libxml++' 'sane' 'podofo' 'tesseract' 'gtkspellmm')
#depends=('hicolor-icon-theme' 'sane' 'tesseract' 'qtspell' 'poppler-qt4')
makedepends=('desktop-file-utils' 'intltool' 'poppler-glib' 'cmake')
#makedepends=('desktop-file-utils' 'intltool')
install=${pkgname}.install
source=(
  "https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=('ffc267c3703a0d9d93455d4e838282b1a7f7debce101a6ec5a01d3c7c9abe50c')

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
