# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.5.2
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://limine-bootloader.org/"
license=("BSD")
source=(https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz)
sha256sums=('aac259208f9cfe76fb38b3e3218cd80bc020ed7cdf38a1345d2ca42726bffd6f')
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
