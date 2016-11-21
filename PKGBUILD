# Contributor: Cyker Way <cykerway at gmail dot com>
# Modified: Tomas Lindquist Olsen <tomas.l.olsen@gmail.com>

pkgname=cnijfilter-ip2700series
pkgver=3.30
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma IP2700 series (with cnijfilter-common330)"
url="http://support-cn.canon-asia.com/contents/CN/ZH/0100271604.html"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
    depends=('lib32-libcups' 'lib32-popt' 'libpng12')
elif [ "${CARCH}" = 'i686' ]; then
    depends=('libcups' 'popt' 'libpng12')
fi
source=(http://gdlp01.c-wss.com/gds/6/0100002716/01/${pkgname}-${pkgver}-1-i386-rpm.tar.gz)
md5sums=('77a18b685c8cf884e752414066473b9a')

package() {
    cd ${pkgdir}
    bsdtar xvf ${srcdir}/${pkgname}-${pkgver}-1-i386-rpm/packages/cnijfilter-common-3.30-1.i386.rpm
    bsdtar xvf ${srcdir}/${pkgname}-${pkgver}-1-i386-rpm/packages/${pkgname}-${pkgver}-1.i386.rpm

    mv usr/local/bin usr/bin
    mv usr/local/share/* usr/share/
    rm -r usr/local

    mkdir -p usr/share/licenses/${pkgname}
    mv usr/share/doc/${pkgname}-${pkgver}/* usr/share/licenses/${pkgname}
    rm -rf usr/share/doc
}
