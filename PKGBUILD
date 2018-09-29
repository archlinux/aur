# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gv
pkgver=3.7.4
pkgrel=4
pkgdesc="A program to view PostScript and PDF documents"
arch=('x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL3')
depends=('xaw3d' 'ghostscript' 'desktop-file-utils')
options=('emptydirs')
source=(http://ftp.gnu.org/gnu/gv/${pkgname}-${pkgver}.tar.gz{,.sig} gv.desktop)
sha256sums=('2162b3b3a95481d3855b3c4e28f974617eef67824523e56e20b56f12fe201a61'
            'SKIP'
            '9b272fe86a7bdfbb170dfd850ae18204ef1ed0982bd88a8b2b3db7a7f5e87eb7')
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
