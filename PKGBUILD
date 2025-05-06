# Maintainer: Nebojsa Stojiljkovic <nebojsa@keemail.me>

pkgname=brother-mfcl2802dn-cups-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-L2802DN printer"
arch=("i686" "x86_64" "armv7l")
url="https://support.brother.com/g/b/downloadlist.aspx?c=eu_ot&lang=en&prod=mfcl2802dn_eu&os=128"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf106050/mfcl2802dnpdrv-4.1.0-1.i386.deb")
md5sums=("974c6e5439372ef53de9c8a9ba170fac")
depends=("cups" "ghostscript")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"

	# fix error shown in CUPS printer status message when printing a test page:
	#
	# Idle - File "/usr/lib/cups/filter/brother_lpdwrapper_MFCL2802DN" not available: No such file or directory
	#
	mkdir -p "${pkgdir}"/usr/lib/cups/filter
	ln -s /opt/brother/Printers/MFCL2802DN/cupswrapper/lpdwrapper \
	  "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_MFCL2802DN
	ln -s /opt/brother/Printers/MFCL2802DN/lpd/$CARCH/rawtobr3 \
	  "${pkgdir}"/opt/brother/Printers/MFCL2802DN/lpd/rawtobr3
	ln -s /opt/brother/Printers/MFCL2802DN/lpd/$CARCH/brprintconflsr3 \
	  "${pkgdir}"/opt/brother/Printers/MFCL2802DN/lpd/brprintconflsr3
}
