# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gv
pkgver=3.6.6
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL')
depends=('xaw3d' 'ghostscript')
install=gv.install
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop gv.png)
md5sums=('0b9c02724af876d9e5556c4e957b6343' 'cf04652952f2d0903bc7578b4826f50c'\
         'ab0e3879dbe39e59ad1c923020c28a86')
sha1sums=('01047040c0f6081609b51a6bdd6f9275293654a7'
          'c8230fe08ee6d22525678a97832f44941237d174'
          '35b9168e526527001b1b5b8ee34a5b69d9369590')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" src/Makefile.{am,in} || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 ../gv.desktop ${pkgdir}/usr/share/applications/gv.desktop || return 1
  install -D -m644 ../gv.png ${pkgdir}/usr/share/pixmaps/gv.png || return 1
  rm ${pkgdir}/usr/share/info/dir
  gzip ${pkgdir}/usr/share/info/*
}
