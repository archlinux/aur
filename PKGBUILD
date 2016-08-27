# Maintainer: Andrey Tkachenko <andreytkachenko64@gmail.com>

pkgname=stm32flash
pkgver=0.5
pkgrel=1
pkgdesc='Open source flash program for the STM32 ARM processors using the ST serial bootloader over UART or I2C'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://sourceforge.net/projects/stm32flash/?source=navbar'
license=('GPL2')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=(http://downloads.sourceforge.net/project/stm32flash/$pkgname-$pkgver.tar.gz)
sha512sums=('a01875a315d92d5e347372b736f2afa2f633851bf13af1326341c0c91e17cef54b6730ed1279280e86d3797033c856dfc25e8c595e010772b9287aaf965273f9')

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -D -m644 gpl-2.0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d $pkgdir/usr/share/doc/$pkgname/
  install -m644 AUTHORS HOWTO I2C.txt TODO protocol.txt $pkgdir/usr/share/doc/$pkgname/
}
