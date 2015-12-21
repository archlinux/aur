# Maintainer: Joshua Ellis <josh@jpellis.me>

pkgname=cups-xerox-phaser-3160
pkgver=1.0.0
pkgrel=1
_rpmname=Xerox-Phaser-3160-Linux.rpm
pkgdesc="CUPS driver for the Xerox Phaser 3160 series"
url="http://www.support.xerox.com/support/phaser-3160/downloads/engb.html?operatingSystem=linux"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
source=("http://download.support.xerox.com/pub/drivers/3160/drivers/linux/bg/P3160.tar.gz")
sha256sums=('f03aea137b7797f5bf098f1142d24a1f24e11fa47e0c6addd026ec5707ea4ffd')

package() {
    chmod -R u+w ${srcdir}
    cd ${srcdir}/media/P3160/Linux
    if [[ "$CARCH" == "i686" ]]; then
        cp -r i386/at_root/usr ${pkgdir}/.
        cp -r i386/at_opt/lib ${pkgdir}/usr/.
    elif [[ "$CARCH" == "x86_64" ]]; then
        cp -r x86_64/at_root/usr ${pkgdir}/.
        mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
        cp -r x86_64/at_opt/lib ${pkgdir}/usr/.
    fi
    mkdir ${pkgdir}/usr/share
    cp -r noarch/at_opt/share/ppd ${pkgdir}/usr/share/.
    rm -rf ${pkgdir}/usr/sbin
}


# Local Variables:
# mode: sh
# End:
