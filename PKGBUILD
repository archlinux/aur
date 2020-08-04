# Maintainer: Oscar Harris <oscar@oscar-h.com>

pkgname=brother-dcp-l5500dn-cups-bin
pkgver=3.5.1
pkgrel=2
pkgdesc="CUPS wrapper for Brother DCP-L5500DN printer"
arch=("i686" "x86_64")
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=dcpl5500dn_us_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf102578/dcpl5500dncupswrapper-3.5.1-1.i386.deb")
sha512sums=("e8d36c4c83dd221f978a4a3de4fb317c9c831be2d573ac90750896f559a32a35a1c7c1501775c358cc7b455250fdfea4881c97e3f7c60ad61818869c1da0a0af")
depends=("brother-dcp-l5500dn-lpr-bin" "cups")

package() {
	# This script is adapted from brother-mfc-l2710dw. Credit to enginefeeder101 for the links

	# Extact data from .deb package
	tar -xf data.tar.gz -C "${pkgdir}"
	
	# Link PPD file to correct directory
	install -d "${pkgdir}/usr/share/cups/model/"
	ln -s "/opt/brother/Printers/DCPL5500DN/cupswrapper/brother-DCPL5500DN-cups-en.ppd" "${pkgdir}/usr/share/cups/model/"
	
	# Link filter 
	install -d "${pkgdir}/usr/lib/cups/filter"
	ln -s "/opt/brother/Printers/DCPL5500DN/cupswrapper/lpdwrapper" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL5500DN"
	ln -s "/opt/brother/Printers/DCPL5500DN/cupswrapper/paperconfigml2" "${pkgdir}/usr/lib/cups/filter/"
}
