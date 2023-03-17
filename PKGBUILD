# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=4.20230317.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://limine-bootloader.org/"
license=('BSD')
depends=('glibc')
source=("https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-${pkgver}.tar.xz")
b2sums=('bdf1911905057a751edce95566d39ba9c8a058e6b3f7a2453978a27c0720b91c6658b1906192e3c091ea1b59853201de02a9136304fc077430fddaf763484068')
makedepends=('nasm' 'mtools' 'llvm' 'lld' 'clang')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-all TOOLCHAIN_FOR_TARGET=llvm
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
