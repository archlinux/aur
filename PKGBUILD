# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=samsung-ml2160
pkgver=3.00.65
pkgrel=2
pkgdesc="Samsung ML-2160 CUPS driver"
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('cups' 'ghostscript')
conflicts=('samsung-unified-driver')
options=(!strip)
source=("http://org.downloadcenter.samsung.com/content/DR/200911/20091118145015140/UnifiedLinuxDriver_1.01.tar.gz"
        "ML-2160.ppd")
md5sums=('b03b7feaf54624a6d07ea3832889fdbc'
         'cf688ffbed12f032ade39db3cc85337a')

package() {
    cd $srcdir
    # fix wrong modes in archive
    chmod u=rwX,g=rX cdroot -R
    chown root:root cdroot -R
    install -m 644 -D "$srcdir/ML-2160.ppd" "$pkgdir/usr/share/cups/model/ML-2160.ppd"
    if [ "$CARCH" = "x86_64" ]; then
        install -m 755 -D "$srcdir/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungspl" \
        "$pkgdir/usr/lib/cups/filter/rastertosamsungspl"
    else
        install -m 755 -D "$srcdir/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl" \
        "$pkgdir/usr/lib/cups/filter/rastertosamsungspl"
    fi
}
