# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=2.75
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-v${pkgver}.tar.xz)
sha256sums=('SKIP')
makedepends=('nasm' 'mtools')
_dir="limine-v${pkgver}"

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  "${srcdir}/${_dir}/configure" --prefix=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
