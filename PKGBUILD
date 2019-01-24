# Maintainer: Clément Lassieur <clement@lassieur.org>
pkgname="brother-hll2360d"
pkgver="3.2.0_1"
pkgrel="1"
pkgdesc="Brother LPR and CUPS driver for HL-L2360DN, HL-L2360DW, HL-L2365DW"
url="https://www.brother.com"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cups')
depends_x86_64=('lib32-glibc')

source=(brother-hll2360d.patch
	https://download.brother.com/welcome/dlf101915/hll2360dcupswrapper-${pkgver//_/-}.i386.rpm
	https://download.brother.com/welcome/dlf101914/hll2360dlpr-${pkgver//_/-}.i386.rpm)
md5sums=('c660e4907fa7594f99305c9862414c03'
         '881e966395a2d67ee648046c9547031b'
         '2a0e27f233d8cbb5dc8e332230db03e7')

prepare() {
  patch -p1 < "$srcdir/brother-hll2360d.patch"
}

package() {
  install -d "$pkgdir/usr/lib/cups/filter/"
  install -d "$pkgdir/usr/share/cups/model/"

  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share/brother"

  ln -s "/usr/share/brother/Printers/HLL2360D/cupswrapper/brother_lpdwrapper_HLL2360D" "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2360D/cupswrapper/brother-HLL2360D-cups-en.ppd" "$pkgdir/usr/share/cups/model/"
}
