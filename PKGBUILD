# Maintainer: loh.tar <loh.tar at googlemail dot com>
# Based on samsung-printers
pkgname='samsung-m262x-m282x'
pkgver='1.00.36_00.91'
pkgrel='2'
pkgdesc='CUPS driver for Samsung Xpress M262x and M282x printers'
arch=('i686' 'x86_64')
url='http://www.samsung.com'
license=('custom:samsung')
depends=('cups')
makedepends=('chrpath')
conflicts=('samsung-printers')
source=("$pkgname-$pkgver.tar.gz::http://downloadcenter.samsung.com/content/DR/201510/20151028111741150/uld_v1.00.36_00.91.tar.gz")
md5sums=('ba1d213aa726efaf20c1b31f4da9fcdc')

package() {
  cd $srcdir

  install -D -m644  \
    "${srcdir}/uld/noarch/license/eula.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"

  install -m 644 -D \
    "${srcdir}/uld/noarch/share/ppd/Samsung_M262x_282x_Series.ppd" \
    "${pkgdir}/usr/share/cups/model/Samsung_M262x_282x_Series.ppd"

  if [ "$CARCH" = "x86_64" ]; then
    install -m 755 -D \
      "${srcdir}/uld/x86_64/rastertospl" \
      "${pkgdir}/usr/lib/cups/filter/rastertospl"

    install -m 755 -D \
      "${srcdir}/uld/x86_64/libscmssc.so" \
      "${pkgdir}/usr/lib/libscmssc.so"
  else
    install -m 755 -D \
      "${srcdir}/uld/i386/rastertospl" \
      "${pkgdir}/usr/lib/cups/filter/rastertospl"

    install -m 755 -D \
      "${srcdir}/uld/i386/libscmssc.so" \
      "${pkgdir}/usr/lib/libscmssc.so"
  fi

  chrpath -d "${pkgdir}/usr/lib/cups/filter/rastertospl"
}
