# Maintainer: TheRedCyclops <nkqecea8@duck.com>
# Contributor: Alex Stelmachonak <mail@ava1ar.me>

pkgname="brother-hl-l3220cw"
pkgver="3.5.1"
pkgrel=1
pkgdesc="CUPS driver for Brother HL-L3220CW"
arch=('x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
_model="hll3220cw"
_revision=1
source=("https://download.brother.com/welcome/dlf105743/${_model}pdrv-${pkgver}-${_revision}.i386.rpm")
sha256sums=('229197fb5b5e5f58570f129f681df617c1297117354ee71c07ce16c081988fe3')

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
