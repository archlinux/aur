# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=gcfflasher
pkgver=4.4.0
pkgrel=1
pkgdesc="Tool to program the firmware of dresden elektronik's Zigbee products."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/dresden-elektronik/gcfflasher"
license=(BSD-3-Clause)
depends=(libgpiod)
makedepends=(git cmake)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver"::"git+https://github.com/dresden-elektronik/$pkgname.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -B "build-$pkgver" -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build "build-$pkgver"
}

package() {
  DESTDIR="$pkgdir" cmake --install "build-$pkgver"
  install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
