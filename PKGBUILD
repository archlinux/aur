# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Rainer Moll <renari@arcor.de>

pkgname=t1lib
pkgver=5.1.2
pkgrel=5
pkgdesc="Library for generating character- and string-glyphs from Adobe Type 1 fonts"
arch=('i686' 'x86_64')
url="http://www.ibiblio.org/pub/Linux/libs/graphics/!INDEX.html"
license=('GPL')
depends=('libxaw')
source=(http://www.ibiblio.org/pub/Linux/libs/graphics/${pkgname}-${pkgver}.tar.gz
        lib-cleanup.diff
        format-security.diff
        CVE-2011-0764.diff
        CVE-2011-1552_1553_1554.patch
        CVE-2010-2642.patch)
md5sums=('a5629b56b93134377718009df1435f3c'
         '82dafb6051d64a94f32c73d59649ddd0'
         'b947e6a732729db2819d4f857a686e2f'
         '60fb9f058a6bb1f760ddaf2ed7d71879'
         '22e03d81fab188139acbe7fd3a0a706a'
         '2283c116d1dda278ee77ef27c1a8e397')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../lib-cleanup.diff
  patch -Np1 -i ../format-security.diff
  patch -Np1 -i ../CVE-2011-0764.diff
  patch -Np1 -i ../CVE-2011-1552_1553_1554.patch
  patch -Np1 -i ../CVE-2010-2642.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make without_doc
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
