# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.17.2
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz")
sha256sums=('3bdde8e7dd1250cf56c16d6283101ef1e4d3cf8cbb24aa40e53dfbe05f453cb7')
makedepends=('nasm' 'mtools' 'llvm' 'lld' 'clang')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-all CROSS_TOOLCHAIN=llvm
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  ln -s ./limine-deploy "${pkgdir}/usr/bin/limine-install"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
