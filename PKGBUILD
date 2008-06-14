# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gv
pkgver=3.6.4
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL')
depends=('xaw3d' 'ghostscript')
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop)
md5sums=('34ea686ea499c938e152ab424859b903' 'cf04652952f2d0903bc7578b4826f50c')
sha1sums=('fe11736ba4a31c7d1f27e3829e6e6765eee6eb31' 'c8230fe08ee6d22525678a97832f44941237d174')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" \
                src/{gv_{class,user,system}.ad,Makefile.{am,in}} || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 ../gv.desktop ${startdir}/pkg/usr/share/applications/gv.desktop || return 1
  install -D -m644 src/gv_icon.xbm ${startdir}/pkg/usr/share/pixmaps/gv.xbm || return 1
}
