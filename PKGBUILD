# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=samsung-printers
pkgver=1.00.36
pkgrel=1
pkgdesc="CUPS drivers for a variety of Samsung printers"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups' 'ghostscript')
source=("http://downloadcenter.samsung.com/content/DR/201510/20151028111741150/uld_v1.00.36_00.91.tar.gz")
md5sums=('ba1d213aa726efaf20c1b31f4da9fcdc')

package() {
  cd $srcdir
  mkdir -p ${pkgdir}/usr/share/cups/model
  cp ${srcdir}/uld/noarch/share/ppd/Samsung* ${pkgdir}/usr/share/cups/model/

  if [ "$CARCH" = "x86_64" ]; then
    install -m 755 -D ${srcdir}/uld/x86_64/rastertospl ${pkgdir}/usr/lib/cups/filter/rastertospl
    install -m 755 -D ${srcdir}/uld/x86_64/libscmssc.so ${pkgdir}/usr/lib/libscmssc.so
  else
    install -m 755 -D ${srcdir}/uld/i386/rastertospl ${pkgdir}/usr/lib/cups/filter/rastertospl
    install -m 755 -D ${srcdir}/uld/i386/libscmssc.so ${pkgdir}/usr/lib/libscmssc.so
  fi
}
