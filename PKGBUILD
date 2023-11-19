# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=gcfflasher
pkgver=4.2.2_beta
pkgrel=1
pkgdesc="Tool to program the firmware of dresden elektronik's Zigbee products."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/dresden-elektronik/gcfflasher"
license=(BSD)
depends=(libgpiod)
makedepends=(git cmake)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver"::"git+https://github.com/dresden-elektronik/$pkgname.git#tag=v${pkgver//_/-}")
sha256sums=('SKIP')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd $pkgname
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
