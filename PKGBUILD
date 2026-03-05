# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="brother-hl-l3230cdw"
pkgver="1.0.2"
pkgrel=1
pkgdesc="CUPS driver for Brother HL-L3230CDW"
arch=('x86_64')
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')
depends=('cups')
_model="hll3230cdw"
_revision=0
source=("https://download.brother.com/welcome/dlf103944/${_model}pdrv-${pkgver}-${_revision}.i386.rpm")
sha256sums=('7dfbc1d2f3543e97ab7ad56b961e47df98c18347b76962408cc9b30b4e452e90')

package() {
	mkdir -p "${pkgdir}/opt/brother"
	cp -R "${srcdir}/opt/brother" "${pkgdir}/opt"
    cp "${srcdir}/opt/brother/Printers/${_model}/lpd"/* "${pkgdir}/opt/brother/Printers/${_model}/lpd"
#    rm -rf "${pkgdir}/opt/brother/Printers/${_model}/lpd/"

	install -d "${pkgdir}/usr/lib/cups/filter/"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	install -d "${pkgdir}/usr/share/cups/model/Brother"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd" "${pkgdir}/usr/share/cups/model/Brother"
	ln -s "/opt/brother/Printers/${_model}/inf" "${pkgdir}/opt/brother/Printers/${_model}/lpd/"
}
