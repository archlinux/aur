# Maintainer: Leo von Klenze <aur@leo.von-klenze.de>
pkgname="brother-mfc-j6930dw"
pkgver="1.0.1"
pkgrel="3"
pkgdesc="Brother MFC-J6930DW CUPS driver."
url="http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcj6930dw_us_eu_as"
license=("EULA")
arch=('i686' 'x86_64')
depends=('lib32-glibc' 'lib32-libstdc++5' 'cups>=2.1.2' 'ghostscript') 
source=(
    https://download.brother.com/welcome/dlf103045/mfcj6930dwcupswrapper-1.0.1-0.i386.deb
    https://download.brother.com/welcome/dlf103021/mfcj6930dwlpr-1.0.1-0.i386.deb
)
noextract=(mfcj6930dwcupswrapper-1.0.1-0.i386.deb mfcj6930dwlpr-1.0.1-0.i386.deb)
md5sums=('25bb3d287571eb6d2c97e4c70565dbce'
         '5005aaf5151631a39611435d7b3315f8')

package() {
    ar x mfcj6930dwlpr-1.0.1-0.i386.deb
    tar -xzf "$srcdir/data.tar.gz" -C "$pkgdir"

    ar x mfcj6930dwcupswrapper-1.0.1-0.i386.deb
    tar -xzf "$srcdir/data.tar.gz" -C "$pkgdir"

    mkdir -p "$pkgdir/usr/share/cups/model/Brother"
    mkdir -p "$pkgdir/usr/share/ppd/Brother"
    mkdir -p "$pkgdir/usr/lib/cups/filter"

    cp "$pkgdir/opt/brother/Printers/mfcj6930dw/cupswrapper/brother_mfcj6930dw_printer_en.ppd" "$pkgdir/usr/share/cups/model/Brother/brother_mfcj6930dw_printer_en.ppd"
    cp "$pkgdir/opt/brother/Printers/mfcj6930dw/cupswrapper/brother_mfcj6930dw_printer_en.ppd" "$pkgdir/usr/share/ppd/Brother/brother_mfcj6930dw_printer_en.ppd"
    ln -s "/opt/brother/Printers/mfcj6930dw/cupswrapper/brother_lpdwrapper_mfcj6930dw" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_mfcj6930dw"
}

