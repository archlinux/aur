# Maintainer: 1Conan <me@1conan.com>
# Contributor: Tux Tong <huntthetux@gmail.com>

pkgname=brother-dcpj105
_printername=dcpj105
pkgver=3.0.0
pkgrel=668
pkgdesc="CUPS driver for Brother DCP-J105 printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
if [ "$CARCH" == "x86_64" ]; then
  depends+=('lib32-libstdc++5' 'lib32-libcups')
fi
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/${_printername}cupswrapper-$pkgver-1.i386.rpm \
	http://www.brother.com/pub/bsc/linux/dlf/${_printername}lpr-$pkgver-1.i386.rpm)
md5sums=('978e10976937951c3e5297117356cae3'
         '8933006312bde91ccc592be599562c9a')
install=dcpj105.install
package() {
   cd "${pkgdir}"
   for n in $srcdir/*.rpm; do
     rpmextract.sh "$n"
   done

   sed -i 's|/etc/init.d/cups|/etc/rc.d/cupsd|' "${pkgdir}/opt/brother/Printers/dcpj105/cupswrapper/cupswrapperdcpj105"
}

