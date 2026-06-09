# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail

# Contributor: Felix Pehla <29adc1fd92@gmail.com>
# Contributor: zapp-brannigan <fuerst.reinje@web.de>
# Contributor: jgottula <justin@jgottula.com>
# Maintainer: Štěpán Němec <stepnem@smrk.net>

pkgname=vdo
pkgver=8.3.1.1
pkgrel=1
pkgdesc='Userspace tools for managing VDO volumes'
arch=(x86_64)
url='https://github.com/dm-vdo/vdo'
license=(GPL-2.0-or-later)
depends=(bash glibc util-linux-libs zlib)
optdepends=('perl: for some of the example scripts')
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
