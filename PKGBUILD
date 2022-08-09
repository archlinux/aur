# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.15
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz")
sha256sums=('6c826094fbc4196a216a2eeb53866b1022a33945d09a2aa4b9e8064d8c5a0aa5')
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
