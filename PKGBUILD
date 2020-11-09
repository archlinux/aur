# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree
pkgver=0.99.19
pkgrel=1
pkgdesc="Hierarchical note-taking application"
arch=('x86_64')
url="https://www.giuspen.com/cherrytree/"
license=('GPL3')
depends=('gspell'
	 'gtksourceviewmm'
	 'libxml++2.6'
	 'uchardet')
makedepends=('cmake'
	     'python-lxml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/giuspen/cherrytree/archive/${pkgver}.tar.gz")
sha256sums=('ebdbcccb368190df613f8e307465e0630215d4497b98386955b1bfb197c956c4')

build() {
  cmake \
	-B "${pkgname}-${pkgver}/build" \
	-S "${pkgname}-${pkgver}" \
	-DBUILD_TESTING:BOOL=OFF \
	-Wno-dev
  make -C "${pkgname}-${pkgver}/build"
}

package() {
  make -C "${pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install
}
