# Maintainer: apaugh (andrew [at] paugh [dot] ca)

pkgname="brother-hl-l2380dw"
pkgver="3.2.0"
pkgrel="3"
pkgdesc="Brother HL-L2380DW CUPS driver"
url="http://www.brother.com"
license=('GPL')
#install="brother-hl-l2380dw.install"
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc' 'ghostscript') 

sha256sums=('a4e51f131e4cb7e9337af161e4be275c1a2628c75be04addff0569ff262185ee'
            'c93037bdcc1ce5d63451ed701637aa0476898ed88a9eb5f6fbef735ccb1d83fc'
            'ae0951ec252a9047c7c4dc32eb8414177d82786c0effec79b9a95bb7bd42ca24')

source=(
  http://download.brother.com/welcome/dlf101770/hll2380dwcupswrapper-$pkgver-1.i386.rpm
  http://download.brother.com/welcome/dlf101769/hll2380dwlpr-$pkgver-1.i386.rpm
  brother_lpdwrapper_HLL2380DW.diff
)

prepare() {
  cd "$srcdir/opt/brother/Printers/HLL2380DW/cupswrapper"
  patch brother_lpdwrapper_HLL2380DW < "$srcdir/brother_lpdwrapper_HLL2380DW.diff"
}

package() {
  cp -R "$srcdir/opt/" "$pkgdir/opt/"
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/opt/brother/Printers/HLL2380DW/cupswrapper/brother_lpdwrapper_HLL2380DW" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2380DW"
}

