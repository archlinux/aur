# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname="brother-hll2380dw"
pkgver="3.2.0_1"
pkgrel="1"
pkgdesc="Brother LPR and CUPS driver for HL-L2380DW"
url="http://www.brother.com"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cups')
depends_x86_64=('lib32-glibc')

source=(brother-hll2380dw.patch
	http://download.brother.com/welcome/dlf101770/hll2380dwcupswrapper-${pkgver//_/-}.i386.rpm
	http://download.brother.com/welcome/dlf101769/hll2380dwlpr-${pkgver//_/-}.i386.rpm)
md5sums=('6fdeafe78178d6335de2f42d859673be'
         '3fe2c6b93ec0acc7886beaa314212fca'
         '1cf4aa246d05da5e8d3bc280d000695e')
prepare() {
  patch -p1 < "$srcdir/brother-hll2380dw.patch"
}

package() {
  install -d "$pkgdir/usr/lib/cups/filter/"
  install -d "$pkgdir/usr/share/cups/model/"

  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share/brother"

  ln -s "/usr/share/brother/Printers/HLL2380DW/cupswrapper/brother_lpdwrapper_HLL2380DW" "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2380DW/cupswrapper/brother-HLL2380DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"
}

