# $Id: PKGBUILD 276082 2017-12-26 02:22:10Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: das-ich <das-ich@yandex.ru>

pkgname=yagf
pkgver=0.9.5
pkgrel=3
pkgdesc="Qt4-based GUI for Cuneiform and Tesseract OCRs"
arch=(x86_64)
url="https://sourceforge.net/projects/yagf-ocr/"
license=('GPL')
depends=('qt4' 'aspell')
optdepends=('cuneiform: recognition tool'
	    'tesseract: recognition tool'
	    'xsane: acquire images from a scanner into YAGF directly')
makedepends=('cmake')
#source=(https://yagf.googlecode.com/archive/yagf-$pkgver.tar.gz)
source=(https://downloads.sourceforge.net/project/yagf-ocr/yagf-$pkgver.tar.gz)
md5sums=('cc01d671fafbfa71fad3d95591ccca37')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cp src/images/{A,a}lign.png
  sed -i '1,1i#include <unistd.h>' src/mainform.cpp
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  [ -d "$pkgdir"/usr/lib64 ] && mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib || true
}
