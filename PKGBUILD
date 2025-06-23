# Maintainer: Felix Pehla <29adc1fd92@gmail.com>
# Contributor: zapp-brannigan <fuerst.reinje@web.de>
# Contributor: jgottula <justin@jgottula.com>

pkgname=vdo
pkgver=8.3.1.1
pkgrel=1
pkgdesc='Userspace tools for managing VDO volumes'
arch=('x86_64')
url="https://github.com/dm-vdo/vdo"
license=('GPL-2.0-or-later')
depends=('device-mapper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('96ab08581e04847c92947e029c58146d8269052dfdcd687518cd26c77376638d')

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
