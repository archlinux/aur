# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.4.7
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://limine-bootloader.org/"
license=("BSD")
source=(https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz)
sha256sums=('f38221e5084bb18db9a631b9e230ab49bc7baa5b53f17c169916e288740f135a')
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
