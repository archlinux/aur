# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=2.73.4
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
  (
    unset CFLAGS
    unset LDFLAGS
    make -C "${_dir}"
  )
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
