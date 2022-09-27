# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=4.20220927.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz")
b2sums=('3c023a0facda1d20926b52aac83e0ce2d2453de9a391885f318946f524330b7b3c1666c7ca7138f2bb0bf3b57afb7b561bbf00bf78a9e3e0b19d3bd018b2ad38')
makedepends=('nasm' 'mtools' 'llvm' 'lld' 'clang')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-all CROSS_TOOLCHAIN=llvm
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
