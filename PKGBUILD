# Maintainer: Andrea Girotto <andrea.girotto@gmail.com>

pkgname=stm32flash
pkgver=0.7
pkgrel=1
pkgdesc='Open source flash program for the STM32 ARM processors using the ST serial bootloader over UART or I2C'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://sourceforge.net/projects/stm32flash/'
license=('GPL2')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname-git")
source=(http://downloads.sourceforge.net/project/stm32flash/$pkgname-$pkgver.tar.gz)
sha512sums=('328254dd043dc707cf8c3edf8ddd4a9441c85d9cb2ca1682bcb3f5301d526b04ed6fb335e72a94e3d26341f18bef45968bf321f0ffeb80eaa0c3add6701349ff')

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
