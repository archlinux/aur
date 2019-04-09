# Maintainer: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes
pkgver=107.1
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('libpulse' 'gtksourceview2' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus')
source=("https://download.byuu.org/${pkgname}_v${pkgver//./r}-source.7z" 'package.patch')
sha256sums=('8649491111ecf257daec4637d7c238ebed534860a16bcfa139d7bca4c2629fbf'
            'b578fba0dd5be5a93b0272704a60fa81c0bb524f9b9894b058c1223927d934d0')

prepare() {
  cd "${pkgname}_v${pkgver//./r}-source"

  patch --forward --strip=1 --input="${srcdir}/package.patch"
}

build() {
  cd "${pkgname}_v${pkgver//./r}-source"

  make -C higan
}

package() {
  cd "${pkgname}_v${pkgver//./r}-source"

  make -C higan prefix="${pkgdir}/usr" install
}
