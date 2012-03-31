# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gv
pkgver=3.7.3.90
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL3')
depends=('xaw3d>=1.6' 'ghostscript' 'desktop-file-utils')
install=gv.install
#source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop gv.png)
source=(ftp://alpha.gnu.org/gnu/gv/${pkgname}-${pkgver}.tar.gz gv.desktop gv.png)
md5sums=('3eba9b449ccae2537e7d14ce85ca9e66'
         'cf04652952f2d0903bc7578b4826f50c'
         'ab0e3879dbe39e59ad1c923020c28a86')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" src/Makefile.{am,in}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../gv.desktop "${pkgdir}/usr/share/applications/gv.desktop"
  install -D -m644 ../gv.png "${pkgdir}/usr/share/pixmaps/gv.png"
}
