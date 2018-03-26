# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Contributor: tlm

pkgname=gimagereader
pkgver=3.2.3
pkgrel=4
pkgdesc="A graphical frontend to tesseract-ocr"
arch=('i686' 'x86_64')
url="https://github.com/manisandro/gImageReader/"
license=('GPL3')
depends=('gtksourceviewmm' 'libxml++2.6' 'sane' 'podofo' 'tesseract' 'gtkspellmm' 'poppler-glib')
makedepends=('desktop-file-utils' 'intltool' 'cmake')
provides=('gimagereader')
conflicts=('gimagereader')
source=("https://github.com/manisandro/gImageReader/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('8ca6b8900671eba7a00fe1f9a728fee6c2ea3ed1ae10cc62dafb0e3f08574420')

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
