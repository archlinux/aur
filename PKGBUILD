# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=4.1.3
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz")
b2sums=('640ad720a0f2104a487040685df0bf6f186444c07b198baac3a3fa0a5076f09d43609a4b5eb40049042fb4f82740e462335a226c515498c4951be269942f1ba4')
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
