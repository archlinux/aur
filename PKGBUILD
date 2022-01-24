# Maintainer: ous50
pkgname=brother-dcpb7500d
pkgver=4.0.0
pkgrel=1
pkgdesc="Printing driver for Brother DCP-B7500 printer"
arch=("i686" "x86_64" "armv7l")
url="https://support.brother.com/g/b/producttop.aspx?c=in&lang=en&prod=dcpb7500d_as_cn"
license=("EULA")
groups=("base-devel")
depends=('cups' 'ghostscript')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=(
    "https://download.brother.com/welcome/dlf103663/dcpb7500dpdrv-$pkgver-1.i386.deb"
    'cupswrapper-license.txt'
	'lpr-license.txt'
    )
md5sums=(
    "c5d5c7febae0eab6254cb7332f4038c0"
    '97ad0cffd216059e9d1d3121899d8646'
    '5e87a3dc0f3e3438c088eda0f3565f0d'
)

package(){
  tar xf data.tar.gz
  cp -R "$srcdir/opt" "$pkgdir/opt"
  ln -s "/opt/brother/Printers/DCPB7500D/lpd/$CARCH/rawtobr3" "$pkgdir/opt/brother/Printers/DCPB7500D/lpd/rawtobr3"
  ln -s "/opt/brother/Printers/DCPB7500D/lpd/$CARCH/brprintconflsr3" "$pkgdir/opt/brother/Printers/DCPB7500D/lpd/brprintconflsr3"

  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/DCPB7500D/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_DCPB7500D"

  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/opt/brother/Printers/DCPB7500D/cupswrapper/brother-DCPB7500D-cups-en.ppd" "$pkgdir/usr/share/cups/model"

  install -Dm644 "$srcdir/opt/brother/Printers/DCPB7500D/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -Dm644 "$srcdir/opt/brother/Printers/DCPB7500D/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}
