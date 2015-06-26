# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>

pkgname=ppd-oki-c610
pkgver=2012
pkgrel=2
pkgdesc="Printer driver for Oki C610 (C610cdn; C610dn; C610dtn; C610n/ C710/ C711)"
arch=(any)
url="http://my.okidata.com/pp-C610dn.nsf?opendatabase"
license=('GPL')
depends=('cups')
optdepends=()
install=oki-c610.install
source=(ftp://ftp2.okidata.com/pub/drivers/linux/SFP/color/desktop/C610PS.tar)
sha512sums=('941d0678af40bfef7f2a517d9b5f1ce112103686e1aab776eeeea86defd173cb579cb1a18d6b99f865e7d02d84e44e8afe26b678128f8246221692493f052164')

package() {
    cd "${srcdir}/C610PS/"
    
    ppdmodel="${pkgdir}/usr/share/cups/model"
    ppdshare="${pkgdir}/usr/share/ppd"

    if [ -x "${ppdmodel}" ] ; then
        ppdpath="${ppdmodel}"
    elif [ -x "${ppdshare}" ] ; then
        ppdpath="${ppdshare}"
    else
        ppdpath="${ppdmodel}"
    fi

    install -D -m 644 C610PS.ppd.gz "${ppdpath}/OKI_C610PS.ppd.gz"
    install -D -m 755 okijobaccounting "${pkgdir}/usr/lib/cups/filter/okijobaccounting"

    #install -D COPYING "${pkgdir}/usr/share/licenses/ppd-oki-c610/LICENSE"
}
