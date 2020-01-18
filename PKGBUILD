# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=bviplus
pkgver=1.0
pkgrel=1
pkgdesc="An ncurses based hex editor with a vim-like interface."
arch=('i686' 'x86_64')
url="http://bviplus.sourceforge.net/"
license=("GPL3")
depends=("ncurses")
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz")
md5sums=('7e9f588679ecd200c64881396c302b8b')

prepare() {
  cd ${pkgname}-${pkgver}
  cp vf_backend.c vf_backend.c.orig
  sed -i -r 's,inline (void compute_percent_complete),\1,' vf_backend.c
  cp Makefile Makefile.orig
  sed -i -r 's,(\$\(EXTRA_CFLAGS\) \$\^),\1 $(LDFLAGS),' Makefile

}

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=${pkgdir}/usr install
}
