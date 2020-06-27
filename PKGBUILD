# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org>

pkgname=samsung-ml-1915
pkgver=1.00.39
pkgrel=1
pkgdesc="CUPS driver for Samsung ML-1915"
arch=('i686' 'x86_64')
url="https://support.hp.com/us-en/drivers/selfservice/samsung-ml-1915-laser-printer-series/17156956"
license=('custom:samsung')
depends=('cups' 'ghostscript')
conflicts=('samsung-printers')
source=("https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-C4010ND/uld_V${pkgver}_01.17.tar.gz")
sha512sums=('8667c1aedd19188db2db461dba3c8ec09b1d7dd7994df7f348ed0819e39e5d5f68a59a4e70f90586b71f6f4e27953e25f50b768c94ae84d52c6bac8e415c3bd8')

package() {
	cd $srcdir

	install -m 644 -D \
		${srcdir}/uld/noarch/share/ppd/Samsung_ML-191x_Series.ppd \
		${pkgdir}/usr/share/cups/model/Samsung_ML-191x_Series.ppd
	if [ "$CARCH" = "x86_64" ]; then
		install -m 755 -D \
			${srcdir}/uld/x86_64/rastertospl \
			${pkgdir}/usr/lib/cups/filter/rastertospl
	else
		install -m 755 -D \
			${srcdir}/uld/i386/rastertospl \
			${pkgdir}/usr/lib/cups/filter/rastertospl
	fi
}
