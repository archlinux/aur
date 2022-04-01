#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=chemtool
pkgver=1.6.14
pkgrel=4
pkgdesc="A small program for drawing chemical structures"
arch=(x86_64)
license=('GPL2')
url="http://ruby.chemie.uni-freiburg.de/~martin/chemtool/chemtool.html"
depends=('gtk2' 'desktop-file-utils')
source=(http://ruby.chemie.uni-freiburg.de/~martin/${pkgname}/${pkgname}-${pkgver}.tar.gz chemtool.desktop)

build() {
  cd ${pkgname}-${pkgver}
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -D -m644 gnome/chemtool.png "${pkgdir}"/usr/share/pixmaps/chemtool.png
  install -D -m644 "${srcdir}"/chemtool.desktop "${pkgdir}"/usr/share/applications/chemtool.desktop
}
md5sums=('3a97680f0abe1327af1f0072551a68e2'
         '8cbb6f7021bd5aaa6f6a31fc4d95a06e')
