# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.2.3
pkgrel=1
pkgdesc="A graphical frontend to tesseract-ocr"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gimagereader/"
license=('GPL3')
depends=('gtksourceviewmm' 'hicolor-icon-theme' 'libxml++2.6' 'sane' 'podofo' 'tesseract' 'gtkspellmm')
#depends=('hicolor-icon-theme' 'sane' 'tesseract' 'qtspell' 'poppler-qt4')
makedepends=('desktop-file-utils' 'intltool' 'poppler-glib' 'cmake')
install=${pkgname}.install
source=(
  "https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=('8ca6b8900671eba7a00fe1f9a728fee6c2ea3ed1ae10cc62dafb0e3f08574420')

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
