# Maintainer: David P. <megver83@parabola.nu>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=libusb

pkgname=libusb-nosystemd
pkgver=1.0.21
pkgrel=1
pkgdesc='Library that provides generic access to USB devices'
arch=('i686' 'x86_64')
url='http://libusb.info/'
license=('LGPL')
depends=('glibc' 'eudev')
provides=("libusbx=$pkgver" "$_pkgname")
conflicts=('libusbx' "$_pkgname")
replaces=('libusb1' 'libusbx')
source=(https://github.com/libusb/libusb/releases/download/v$pkgver/libusb-$pkgver.tar.bz2)
md5sums=('1da9ea3c27b3858fa85c5f4466003e44')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make -j1
}

check() {
  make -C $_pkgname-$pkgver check
}

package () {
  make -C $_pkgname-$pkgver DESTDIR="$pkgdir" install
}
