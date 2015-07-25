# Maintainer: lilydjwg <lilydjwg@gmail.com>
pkgname=cutils
pkgver=1.6
pkgrel=1
pkgdesc="Collection of utilities for C programmers"
arch=(i686 x86_64)
url="http://www.sigala.it/sandro/software.php#cutils"
license=("custom:as is")
source=(http://www.sigala.it/sandro/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('8b9ec6fa72e209694f4412a092164b67')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make
}
package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  # A better program is provided by 'cdecl' package
  rm ${pkgdir}/usr/bin/c{,un}decl
  rm ${pkgdir}/usr/share/man/man1/c{,un}decl.1
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
# vim:syntax=sh
