# Maintainer: Andrea Girotto <andrea.girotto@gmail.com>

pkgname=stm32flash
pkgver=0.6
pkgrel=3
pkgdesc='Open source flash program for the STM32 ARM processors using the ST serial bootloader over UART or I2C'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://sourceforge.net/projects/stm32flash/'
license=('GPL2')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname-git")
source=(http://downloads.sourceforge.net/project/stm32flash/$pkgname-$pkgver.tar.gz)
sha512sums=('2d92ecf4f82b8a702b596cbf3c4ff594f67083f7dcec82c064555f73b47834b41a918efa1846e47fc8740ae63fa818b16dfb5b38fa242c17f465666a651eee3a')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -D -m644 gpl-2.0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d $pkgdir/usr/share/doc/$pkgname/
  install -m644 AUTHORS HOWTO I2C.txt TODO protocol.txt $pkgdir/usr/share/doc/$pkgname/
}
