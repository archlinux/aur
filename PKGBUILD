# Maintainer: Igor Muzyka <muzyka-iv@mail.ru>

pkgname=brother-dcp1510
pkgver=3.0.1_1
pkgrel=4
pkgdesc="Brother cups and lpr driver for DCP-1510, DCP-1510r, DCP-1511, DCP-1512, DCP-1512r, DCP-1518"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/s/id/linux/en/download_prn.html"
license=('GPL')
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: scanner support')

source=(http://www.brother.com/pub/bsc/linux/dlf/dcp1510lpr-3.0.1-1.i386.rpm
		http://www.brother.com/pub/bsc/linux/dlf/dcp1510cupswrapper-3.0.1-1.i386.rpm
		brother-dcp1510.rules)

md5sums=('0402bc86764692b02ef412ba6df3b9de'
         '49689b80de1b5d08244eb9a9be1399fd'
         '96b094bae2bcc3cc18a0139583fd9b86')

install=install

package() {
cp -rv ${srcdir}/opt ${pkgdir}/
cp -rv ${srcdir}/var ${pkgdir}/

mkdir -p ${pkgdir}/usr/share/cups/model
mkdir -p ${pkgdir}/usr/lib/cups/filter

ln -sv /opt/brother/Printers/DCP1510/cupswrapper/brother-DCP1510-cups-en.ppd ${pkgdir}/usr/share/cups/model
ln -sv /opt/brother/Printers/DCP1510/cupswrapper/brother_lpdwrapper_DCP1510 ${pkgdir}/usr/lib/cups/filter

install -D -m644 $srcdir/brother-dcp1510.rules $pkgdir/etc/udev/rules.d/brother-dcp1510.rules
}
