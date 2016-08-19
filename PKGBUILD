# Maintainer: Gore Liu <goreliu@126.com>

pkgname=pipo
pkgver=1.3
pkgrel=1
pkgdesc='Make any program a filter'
arch=('any')
url='http://membled.com/work/apps/pipo/'
license=('GPL2')
depends=('perl')
source=("http://membled.com/work/apps/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6f503af25be498fac79523c2f171fa79')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  perl Makefile.PL PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/bin/site_perl"/* "${pkgdir}/usr/bin"
  rmdir "${pkgdir}/usr/bin/site_perl"
  rm -rf "${pkgdir}/usr/lib"
}
