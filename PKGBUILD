# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=4.20221016.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz")
b2sums=('8a774122d55125298b78d33be0792275ae0e91b0a2a813117ca0989457c76397079b7604995dd2f087afc320afad57bbae98c840ff85b13207a26c2cfc3f2076')
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
