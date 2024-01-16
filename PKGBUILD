# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Patrick Stewart <patstew@gmail.com>
# Adapted from brother-hl8350cdw by giulio

pkgname='brother-hl-l8260cdw'
pkgver='1.5.0'
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother HL-L8260CDW'
arch=('i686' 'x86_64')
url='https://www.brother-usa.com/products/hll8360cdw'
license=('custom:brother commercial license')
depends=('cups' 'perl')
install='brother-hl-l8260cdw.install'

source=(
	'https://download.brother.com/welcome/dlf103219/hll8260cdwcupswrapper-1.5.0-0.i386.rpm'
	'https://download.brother.com/welcome/dlf103210/hll8260cdwlpr-1.5.0-0.i386.rpm'
	'cupswrapper-license.txt'
	'lpr-license.txt'
)

b2sums=('8365d24ecd62ad7e340b8c374ecc472468ec8bbe11cfb8a6acd72a8ff59b1fb3a259b275be3796d9dc3b7419c8eb70700cb670ce24a835efddea47109760e47f'
	'b9fbef8bc3f54f67118c074ea40117ee88f974a99a63aff47cf4ec8b6608fbeaa3aaf18e71c75e6c2c78c429042c64094f5c03e5c35f0bc53a59475d3c4b208c'
	'291f99f656a9954c91d5dfc618324a523ce228857d28ad09116a87006d01060db9d2819d7c9d9c08248b1dea0ca5542bd95bea7d159b2010f442ef43f48551f7'
	'1da07819bb55a198f9c10162223a5db6edd554ebaf6055b083877cb137c2453c20a72c661e9efb281d848e80c43cb6c44ec472c3dc9e7a2abc4d9b9fbee8e2c2'
)

package() {
	printer_model='hll8260cdw'
	ppd_file="/opt/brother/Printers/${printer_model}/cupswrapper/brother_${printer_model}_printer_en.ppd"
	lpd_file="/opt/brother/Printers/${printer_model}/cupswrapper/brother_lpdwrapper_${printer_model}"

	cp -R "$srcdir/opt" "$pkgdir"

	install -d "$pkgdir/usr/share/ppd"
	ln -s "${ppd_file}" "$pkgdir/usr/share/ppd/brother_${printer_model}_printer_en.ppd"
	install -d "$pkgdir/usr/share/cups/model"
	ln -s "${ppd_file}" "$pkgdir/usr/share/cups/model/brother_${printer_model}_printer_en.ppd"
	install -d "$pkgdir/usr/lib/cups/filter"
	ln -s "${lpd_file}" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${printer_model}"

	install -m 644 -D cupswrapper-license.txt "$pkgdir/usr/share/licenses/${pkgname}/cupswrapper-licence.txt"
	install -m 644 -D lpr-license.txt "$pkgdir/usr/share/licenses/${pkgname}/lpr-licence.txt"
}
