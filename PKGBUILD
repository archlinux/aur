# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.7.2
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=('x86_64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://limine-bootloader.org/files/limine/limine-${pkgver}.tar.xz")
sha256sums=('5451fb1ee9435abac8ec47acf7aa0d455200cd12a9c7dbdad84ae860c7a4ca47')
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
