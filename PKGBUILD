# Maintainer: Manos Wagner <manos.wagner@gmail.com>
# Contributor: Silvano Sallese <silvano.sallese@ik.me>

pkgname=brother-mfcj430w-cups-bin
_printer=mfcj430w
pkgver=3.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-J430W printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=mfcj430w_all&os=128&dlid=dlf006572_000&flang=4&type3=561"
license=("EULA")
depends=("cups")
optdepends=("brscan4: scanner support"
            "brscan-skey: scan key support")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006572/mfcj430wcupswrapper-3.0.0-1.i386.deb")
md5sums=("01f8fdb5ff7d047d947fadf17d5d4f60")
install="brother-mfcj430w-cups-bin.install"

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
	
	install -Dm644 "$pkgdir/opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
		-t "$pkgdir/usr/share/ppd/Brother"

	install -Dm644 "$pkgdir/opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
		-t "$pkgdir/usr/share/cups/model/Brother"


	mkdir -p -m755 "$pkgdir/usr/lib/cups/filter"
	ln -s "/opt/brother/Printers/$_printer/cupswrapper/cupswrapper${_printer}" \
		"$pkgdir/usr/lib/cups/filter"
}

