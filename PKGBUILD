# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.5.3
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://limine-bootloader.org/"
license=("BSD")
source=(https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz)
sha256sums=('8cb9084b78ebd2190dee5e540bf6c592e47ec439b1c77dda62c1eeaf4be45a4f')
makedepends=('nasm' 'mtools')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  ln -s ./limine-deploy "${pkgdir}/usr/bin/limine-install"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
