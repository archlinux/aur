# Maintainer: Daniel Müllner <daniel@danifold.net>
# Contributor: Marco Carrozzo <ozeta86@gmail.com>
pkgname=samsung-ml1710
pkgver=1
pkgrel=3
pkgdesc="Samsung ML-1710 CUPS driver"
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript')
license=('custom:samsung')
url="http://www.samsung.com"
source=("https://downloadcenter.samsung.com/content/DR/200707/20070720165436796_UnifiedLinuxDriver.tar.gz")
sha256sums=('16eeb8ffd482289222b0defc9159a47db1402e5022233070d28fd27f07750754')

package() {
    cd $startdir/src/ || return 1
    # fix wrong modes in archive
    chmod u=rwX,g=rX cdroot -R
    chown root:root cdroot -R
    install -m 644 -D "$startdir/src/cdroot/Linux/noarch/at_opt/share/ppd/ML-1710spl2.ppd" \
    "$startdir/pkg/usr/share/cups/model/ML-1710spl2.ppd"
    if [ "$CARCH" = "x86_64" ]; then
        install -m 755 -D "$startdir/src/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    else
        install -m 755 -D "$startdir/src/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl" \
        "$startdir/pkg/usr/lib/cups/filter/rastertosamsungspl"
    fi
}
