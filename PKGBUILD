# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=ocrgui
pkgver=0.2.2
pkgrel=5
pkgdesc="GUI for OCR programs (Tesseract, GOCR)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ocrgui/"
license=('GPL3')
makedepends=('intltool')
depends=('gtk2' 'hunspell' 'imagemagick')
optdepends=('gocr: OCR program'
            'tesseract: OCR program')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/ocrgui/$pkgname-$pkgver.tar.gz)
md5sums=('1d363a4ea88f6ab8080d9f7e29989c0d')

prepare() {
  cd $pkgname-$pkgver

  # Fix: remove trailing space character from subdirectory name 'scalable'
  sed -i 's|\(size[ ]*=[ ]*scalable\)[ ]*$|\1|' data/icons/scalable/apps/Makefile.{am,in}

  # Fix: remove leading underscore character from property names
  sed -i 's|^_||g' data/ocrgui.desktop.in
  # Fix: remove trailing space characters
  sed -i 's|[ ]*$||g' data/ocrgui.desktop.in
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

