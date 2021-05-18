# Maintainer: Suraj Kurapati <sunaku@gmail.com>

pkgname=brother-mfcl2690dw-cups-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-L2690DW printer"
arch=("i686" "x86_64" "armv7l")
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=mfcl2690dw_us&os=128"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf105065/mfcl2690dwpdrv-4.0.0-1.i386.deb")
md5sums=("c75332f2c24d4202b8bbdac784240440")
depends=("cups" "ghostscript")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"

	# fix error shown in CUPS printer status message when printing a test page:
	#
	# Idle - File "/usr/lib/cups/filter/brother_lpdwrapper_MFCL2690DW" not available: No such file or directory
	#
	mkdir -p "${pkgdir}"/usr/lib/cups/filter
	ln -s /opt/brother/Printers/MFCL2690DW/cupswrapper/lpdwrapper \
	  "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_MFCL2690DW

	# fix errors from "/usr/lib/cups/filter/brother_lpdwrapper_MFCL2690DW" script:
	#
	# which: no gs in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl)
	# sh: line 1: /opt/brother/Printers/MFCL2690DW/lpd/rawtobr3: No such file or directory
	# sh: line 1: -r600: command not found
	#
	ln -s /opt/brother/Printers/MFCL2690DW/lpd/$CARCH/rawtobr3 \
	  "${pkgdir}"/opt/brother/Printers/MFCL2690DW/lpd/rawtobr3
	ln -s /opt/brother/Printers/MFCL2690DW/lpd/$CARCH/brprintconflsr3 \
	  "${pkgdir}"/opt/brother/Printers/MFCL2690DW/lpd/brprintconflsr3
}
