# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org>

pkgname=samsung-ml-1915
pkgver=1
pkgrel=1
pkgdesc="Samsung ML-1915 CUPS driver"
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript')
license='custom:samsung'
url="http://www.samsung.com"
source=("http://downloadcenter.samsung.com/content/DR/200911/20091118142414703/UnifiedLinuxDriver_1.02.tar.gz")
md5sums=('49e44d27a7a63ddb8ba1a5d4f650b35e')

build() {
    cd $startdir/src/ || return 1
    # fix wrong modes in archive
    chmod u=rwX,g=rX cdroot -R
    chown root:root cdroot -R
    install -m 644 -D "$startdir/src/cdroot/Linux/noarch/at_opt/share/ppd/ML-191xspl2.ppd" \
    "$startdir/pkg/usr/share/cups/model/ML-191xspl2.ppd"
    if [ "$CARCH" = "x86_64" ]; then
        install -m 755 -D "$startdir/src/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    else
        install -m 755 -D "$startdir/src/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    fi
}