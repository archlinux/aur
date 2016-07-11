# Maintainer: Joerg Schuck <joerg.schuck@web.de>
# Contributor: Clément Lassieur <clement@lassieur.org>
pkgname="brother-hll2340d"
pkgver="3.2.0_1"
pkgrel="5"
pkgdesc="Brother HL-L2340D CUPS driver"
url="http://www.brother.com"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cups')
depends_x86_64=('lib32-glibc')

source=(
	'brother-hll2340d.patch'
	"http://download.brother.com/welcome/dlf101910/hll2340dlpr-${pkgver//_/-}.i386.rpm"
	"http://download.brother.com/welcome/dlf101911/hll2340dcupswrapper-${pkgver//_/-}.i386.rpm"
)
md5sums=('b821fe5b9c1f072317bd327d76310f6f'
         '90ab2e6b0708ad8b23f6911245f9a50f'
         '3c1c19e4ffbfa2adb42e5eea3776e376')
sha512sums=('b3fcd2a9713f2fbdee575d7b225f0b7069614bf7d65224b69d2589e396e3f33aa8f3489fb462aaf1995592f0eafab26fad236ba5ffff06bedd452e097f87e76c'
            '984f4408e05c7f182308cff1ce7af480c7a5eae8dbbf28f832aef8eb5ea5c282ee74b9b8ae371ea0cd837453515bd7b3d413b57d6abcfcf4beb3bda738090b62'
            '8693eafc78bd5fea58a237a29a58616642da940d01589d0c719b649391160b0482da609bfb0533b06b8a659b87be960ad09516a1dc48835e78f03ed600530d53')
prepare() {
  patch -p1 < "$srcdir/brother-hll2340d.patch"
}

package() {
  install -d "$pkgdir/usr/lib/cups/filter/"
  install -d "$pkgdir/usr/share/cups/model/"

  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share/brother"

  ln -s "/usr/share/brother/Printers/HLL2340D/cupswrapper/brother_lpdwrapper_HLL2340D" "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2340D/cupswrapper/brother-HLL2340D-cups-en.ppd" "$pkgdir/usr/share/cups/model/"
}
