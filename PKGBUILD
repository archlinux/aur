# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=4.3
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz")
b2sums=('b3635fc7901d4055527a3efeaa8ede6da7c6e2c63e1f3c7ab87dfcf18660aecc3f60c5bedb660a7349430a6c4188b36ce9c2961a8898c331a8800f846ba5c20c')
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
