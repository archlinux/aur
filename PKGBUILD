# Contributor: Swift Geek <swiftgeek@gmail.com>

pkgname=brother-dcpj125
_printername=dcpj125
pkgver=1.1.3
pkgrel=666
pkgdesc="CUPS driver for Brother DCP-J125 printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
if [ "$CARCH" == "x86_64" ]; then
  depends+=('lib32-libstdc++5')
fi
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/${_printername}cupswrapper-$pkgver-1.i386.rpm \
	http://www.brother.com/pub/bsc/linux/dlf/${_printername}lpr-$pkgver-1.i386.rpm)
md5sums=('9c34e1e1adc8a407c760733d71afbc1e'
         '89f80266ee645dfa9c2a4d18b145e67e')
install=dcpj125.install
package() {
   cd "$pkgdir"
   for n in $startdir/src/*.rpm; do
     rpmextract.sh "$n"
   done

   sed -i 's|/etc/init.d/cups|/etc/rc.d/cupsd|' "${pkgdir}/opt/brother/Printers/dcpj125/cupswrapper/cupswrapperdcpj125"
}

