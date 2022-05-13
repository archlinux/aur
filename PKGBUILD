# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.4.5
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://limine-bootloader.org/"
license=("BSD")
source=(https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz)
sha256sums=('ceede268ee189f54bbb99f02c958206d3c0ee9a290bc29d5ff3a4a81ab4a4552')
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
