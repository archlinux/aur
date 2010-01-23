# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gv
pkgver=3.6.8
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL')
depends=('xaw3d>=1.5E' 'ghostscript')
install=gv.install
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop gv.png)
md5sums=('581ef7834c0e07ac1536b1ee8faa11d5' 'cf04652952f2d0903bc7578b4826f50c'\
         'ab0e3879dbe39e59ad1c923020c28a86')
sha1sums=('18594cb42a5f7b1453af2bd9a5598f781c7a1c9f' 'c8230fe08ee6d22525678a97832f44941237d174'\
         '35b9168e526527001b1b5b8ee34a5b69d9369590')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" src/Makefile.{am,in} || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 ../gv.desktop "${pkgdir}/usr/share/applications/gv.desktop" || return 1
  install -D -m644 ../gv.png "${pkgdir}/usr/share/pixmaps/gv.png" || return 1
}
