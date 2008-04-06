# $Id: PKGBUILD,v 1.16 2007/07/17 05:37:03 eric Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=gv
pkgver=3.6.3
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL')
depends=('xaw3d' 'ghostscript')
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop)
md5sums=('0947fdbccaba114ac24da339dbf7d01a' 'cf04652952f2d0903bc7578b4826f50c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" \
                src/{gv_{class,user,system}.ad,Makefile.{am,in}} || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 ../gv.desktop ${startdir}/pkg/usr/share/applications/gv.desktop
  install -D -m644 src/gv_icon.xbm ${startdir}/pkg/usr/share/pixmaps/gv.xbm
}
