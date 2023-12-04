# Maintainer: Alex Stelmachonak <mail@ava1ar.me>

pkgname="brother-hl-l3220cdw"
pkgver="3.5.1"
pkgrel=1
pkgdesc="CUPS driver for Brother HL-L3220CDW"
arch=('x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
_model="hll3220cdw"
_revision=1
source=("https://download.brother.com/welcome/dlf105742/${_model}pdrv-${pkgver}-${_revision}.i386.rpm")
sha256sums=('3cabeb4f8e29d54a2e684220e0f3c2ad28ec599cba9f7b4e8270d9abbfe25fed')

package() {
	mkdir -p "${pkgdir}/opt/brother"
	cp -R "${srcdir}/opt/brother" "${pkgdir}/opt"
    cp "${srcdir}/opt/brother/Printers/${_model}/lpd/x86_64"/* "${pkgdir}/opt/brother/Printers/${_model}/lpd"
    rm -rf "${pkgdir}/opt/brother/Printers/${_model}/lpd/"{i686,x86_64}

	install -d "${pkgdir}/usr/lib/cups/filter/"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	install -d "${pkgdir}/usr/share/cups/model/Brother"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd" "${pkgdir}/usr/share/cups/model/Brother"
	ln -s "/opt/brother/Printers/${_model}/inf" "${pkgdir}/opt/brother/Printers/${_model}/lpd/"
}
