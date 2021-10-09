# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=samsung-printers
pkgver=1.00.39
pkgrel=1
pkgdesc="CUPS drivers for a variety of Samsung printers"
arch=(x86_64 i686)
url="https://www.bchemnet.com/suldr/"
license=('custom:samsung')
depends=(cups ghostscript)
source=("$url/driver/UnifiedLinuxDriver-$pkgver.tar.gz")
sha256sums=('0c38213b846644500526bf281caaa6e36c40b8f2241cac2f0398c97c3814540e')

package() {
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
