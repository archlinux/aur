# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=samsung-printers
pkgver=1.00.37
pkgrel=1
pkgdesc="CUPS drivers for a variety of Samsung printers"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups' 'ghostscript')
source=("http://downloadcenter.samsung.com/content/DR/201512/20151210091120064/uld_v${pkgver}_00.99.tar.gz")
md5sums=('8347641b2464c8bea8f7a1c4e1d26e8c')

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
