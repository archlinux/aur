# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.5
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://limine-bootloader.org/"
license=("BSD")
source=(https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz)
sha256sums=('12d3c24627595947653c67411e5cde08a083a9d9dbcf17ea479cee92b49e6601')
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
