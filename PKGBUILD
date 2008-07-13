# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gv
pkgver=3.6.5
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL')
depends=('xaw3d' 'ghostscript')
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop)
md5sums=('ce3081b1b3e6258607f2de70f39cbcd2' 'cf04652952f2d0903bc7578b4826f50c')
sha1sums=('90d0bd5b8243108925d46ddf478c7499b475df3a' 'c8230fe08ee6d22525678a97832f44941237d174')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" \
                src/{gv_{class,user,system}.ad,Makefile.{am,in}} || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 ../gv.desktop ${pkgdir}/usr/share/applications/gv.desktop || return 1
  install -D -m644 src/gv_icon.xbm ${pkgdir}/usr/share/pixmaps/gv.xbm || return 1
}
