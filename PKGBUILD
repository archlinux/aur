# Maintainer: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.2.0
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
sha256sums=('e31c6664f53503c8109135eadef74314cdbba649a26267ade7bbb9a63e33a5f2')

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
