# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: BxS (bxsbxs at gmail dot com)
# Contributor: Tom Billiet (mouse256@ulyssis.org)
# Contributor: Kevin Cox (youarefunny - kevincox.ca@gmail.com)

pkgname=piklab
pkgver=0.16.2
pkgrel=3
pkgdesc="IDE for applications based on Microchip PIC and dsPIC microcontrollers similar to the MPLAB environment"
url="http://piklab.sourceforge.net"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-runtime' 'libusb-compat' 'kdebase-katepart')
makedepends=('cmake' 'automoc4')
optdepends=('pk2cmd-plus: PICkit 2 CLI software with updated DeviceFile and udev rules'
            'pikloops: Utility to compute timing loops'
            'gputils: PIC programming utilities'
            'sdcc: C compiler')
install=$pkgname.install
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('38002479c6ed62d5a1f54678330f5bd2')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cmake -D 'CMAKE_INSTALL_PREFIX=/usr' .
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr
  make DESTDIR="${pkgdir}" -j1 install
  mv -v ${pkgdir}/lib ${pkgdir}/usr
}

