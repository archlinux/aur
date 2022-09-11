# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=4.0.1
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('i686' 'x86_64' 'aarch64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz")
sha256sums=('94594fbb935b5a68623f542594dcdc08db808b60597e6e8f378b8fb90533f5e8')
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
