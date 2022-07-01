# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.9.2
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz")
sha256sums=('38f13013402c582589cca69ab75d2b1f80d26e28d61027980e6625e2fe036f7b')
makedepends=('nasm' 'mtools' 'llvm' 'lld' 'clang')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-all TOOLCHAIN=llvm
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  ln -s ./limine-deploy "${pkgdir}/usr/bin/limine-install"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
