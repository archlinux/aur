# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Contributor: libernux <dutchman55@gmx.com>
# Category: system
pkgname=brother-mfc-7460dn
pkgver=2.0.4
pkgrel=3
pkgdesc='LPR and CUPS driver for the Brother MFC-7460DN'
url='http://support.brother.com/g/s/id/linux/en/download_prn.html#MFC-7460DN'
arch=('i686' 'x86_64')
license=('custom:brother commercial license')
depends=('cups')
if test "$CARCH" == x86_64; then
    depends+=('lib32-glibc')
fi
install="$pkgname.install"
source=(
    "http://www.brother.com/pub/bsc/linux/dlf/cupswrapperMFC7460DN-$pkgver-2.i386.rpm"
    'MFC7460DN.ppd'
    'brlpdwrapperMFC7460DN'
    'http://www.brother.com/pub/bsc/linux/dlf/mfc7460dnlpr-2.1.0-1.i386.rpm'
    'LICENSE.cupswrapper'
    'LICENSE.lpr'
)
md5sums=(
    '4329c24062a836c2788854f901c453d3'
    '9b820cfb4793a7502d425f07b2d8900d'
    '2516aae8ef878268234775fea36904cc'
    'b255588a630e399e6d5bf8ec25de1d80'
    '809c64563dbd89f89ca68f9218c59cf5'
    'bf894a1a51baf6055a6c58ecf43c9782'
)

package() {
    cp -a usr "$pkgdir/"
    cp -a var "$pkgdir/"
    install -Dm 644 'MFC7460DN.ppd' "$pkgdir/usr/share/cups/model/MFC7460DN.ppd"
    install -Dm 755 'brlpdwrapperMFC7460DN' "$pkgdir/usr/lib/cups/filter/brlpdwrapperMFC7460DN"
    chmod a+w "$pkgdir/usr/local/Brother/Printer/MFC7460DN/inf/brMFC7460DNrc"
    chmod a+w "$pkgdir/usr/local/Brother/Printer/MFC7460DN/inf"
    install -Dm 644 'LICENSE.cupswrapper' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.cupswrapper"
    install -Dm 644 'LICENSE.lpr' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.lpr"
}
