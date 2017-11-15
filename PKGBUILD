# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gv
pkgver=3.7.4
pkgrel=3
pkgdesc="A program to view PostScript and PDF documents"
arch=('x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL3')
depends=('xaw3d' 'ghostscript' 'desktop-file-utils')
options=('emptydirs')
source=(http://ftp.gnu.org/gnu/gv/${pkgname}-${pkgver}.tar.gz{,.sig} gv.desktop)
sha1sums=('d5bc11a37136dff69248f943a632544a4036b63f'
          '7d8b7edd60617b189ba39ca982252b0d59c0755d'
          'b40ccad8a8d837791598075f543edce9aa1f4352')
validpgpkeys=('5A15E3DBE8D7DE6F2AC69EB5B1AF90204976D4CD')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" src/Makefile.{am,in}
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../gv.desktop "${pkgdir}/usr/share/applications/gv.desktop"
  install -D -m644 src/gv_icon.xbm "${pkgdir}/usr/share/pixmaps/gv.xbm"
}
