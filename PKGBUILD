# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gv
pkgver=3.7.2
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL')
depends=('xaw3d' 'ghostscript' 'desktop-file-utils')
install=gv.install
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop gv.png)
md5sums=('eb47d465755b7291870af66431c6f2e1'
         'cf04652952f2d0903bc7578b4826f50c'
         'ab0e3879dbe39e59ad1c923020c28a86')
sha1sums=('d9573e17f5d88d150fccb257ce205dbceab83e8a'
          'c8230fe08ee6d22525678a97832f44941237d174'
          '35b9168e526527001b1b5b8ee34a5b69d9369590')

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
