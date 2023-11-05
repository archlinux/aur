# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='undiet'
pkgver='0.1'
pkgrel=1
pkgdesc='Diet decompression library.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/bokic/undiet'
license=('LGPL3')
makedepends=('cmake' 'ninja' 'gcc')
depends=('glibc')

source=($pkgname-$pkgver.tar.gz::"https://github.com/bokic/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=("aa1cf79e6b052181bc11e9e26337bbdfd9eb9d1d5d31b56a682c8aba8dc2df4a")

build() {
  cmake -G Ninja -S "${srcdir}/${pkgname}-${pkgver}" -B "build"
  ninja -C "build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "build" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/undiet.h" "$pkgdir/usr/include/undiet.h"
}
