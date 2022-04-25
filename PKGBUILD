# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=3.4.3
pkgrel=2
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://limine-bootloader.org/"
license=("BSD")
source=(https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz)
sha256sums=('35244955084b4cd0ec364a9fdf0520eddbafec545d6eb15c29b0f3d4baffca35')
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
