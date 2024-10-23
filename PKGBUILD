# Maintainer: Felix Pehla <29adc1fd92@gmail.com>
# Contributor: zapp-brannigan <fuerst.reinje@web.de>
# Contributor: jgottula <justin@jgottula.com>

pkgname=vdo
pkgver=8.3.0.72
pkgrel=1
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL-2.0-or-later')
depends=('device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0be32e6c0b95548965b620af2d40532b88f326e992b6fbb740a9e27f977caafb')

build() {
  cd "$pkgname-$pkgver"
  make EXTRA_LDFLAGS="-z relro -z now"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" \
       mandir=/usr/share/man \
       install
}
