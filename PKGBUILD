# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

pkgname=libretro-amiarcadia-git
pkgver=r9.34af1c9
pkgrel=1
pkgdesc='AmiArcadia core (Signetics 2650 CPU-based systems like Emerson Arcadia 2001, Interton VC 4000, and Elektor TV Games Computer)'
arch=('x86_64' 'aarch64')
url='https://github.com/warmenhoven/amiarcadia'
license=('custom:Non-commercial')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git' 'make')
provides=('libretro-amiarcadia')
conflicts=('libretro-amiarcadia')
source=("${pkgname}::git+https://github.com/warmenhoven/amiarcadia.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  make -C "${pkgname}"
}

package() {
  # Install the compiled libretro core
  install -D -t "${pkgdir}/usr/lib/libretro/" "${pkgname}/amiarcadia_libretro.so"

  # Arch Linux guidelines require custom licenses to be packaged in /usr/share/licenses.
  # If the repository includes a LICENSE file, uncomment the following line and update the filename if needed:
  # install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
