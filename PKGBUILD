# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=2.76
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-v${pkgver}.tar.xz)
sha256sums=('SKIP')
makedepends=('nasm' 'mtools')
_pkgsrcdir="$(realpath -m src/limine-v${pkgver})"
_pkgbuilddir="$(realpath -m build/limine-v${pkgver})"

build() {
  mkdir -p "${_pkgbuilddir}" && cd "${_pkgbuilddir}"
  "${_pkgsrcdir}/configure" --prefix=/usr
  make
}

package() {
  cd "${_pkgbuilddir}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${_pkgsrcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
