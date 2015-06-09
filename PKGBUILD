# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=amos
pkgver=3.1.0
pkgrel=3
pkgdesc='A modular, open source whole-genome assembler'
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/mediawiki/amos/index.php?title=AMOS"
license=('Artistic')
options=(!makeflags) # Parallel build is broken in released version

# qt4 and xorg-server required by "Hawkeye" program
depends=('python2' 'perl' 'perl-xml-parser' 'perl-dbi' 
	 'perl-statistics-descriptive' 'qt4' 'xorg-server')

optdepends=('mummer: for AMOScmp, minimus2, amosvalidate'
	    'blat: for minimus2-blat')

makedepends=('boost')

source=(
"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
"amos-3.1.0-gcc4.7.patch"
)

build() {
  cd ${pkgname}-${pkgver}
  patch -p1 < ${srcdir}/amos-3.1.0-gcc4.7.patch
  PYTHON=/usr/bin/python2 PERL=/usr/bin/perl \
	  	./configure --prefix=/usr --with-qmake-qt4=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/amos/COPYING
}
md5sums=('51ebe835c93eef9acd39101738b2048c'
         '1eafa4de5d5837b8761c8f49e40a20d4')
