# Maintainer: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes
pkgver=108
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('libpulse' 'gtksourceview2' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus')
source=("https://download.byuu.org/${pkgname}_v${pkgver//./r}-source.7z" 'package.patch')
sha256sums=('49c560b8438d0ea3942b1cd90ac3d4b5a33074eca77a0b24a7af463e87187bec'
            'e800849a4e6c9b431578c2c55bfaab7b0619629ba34bd97f38bae64d5f2412d6')

prepare() {
  cd "${pkgname}_v${pkgver//./r}-source"

  patch --forward --strip=1 --input="${srcdir}/package.patch"
}

build() {
  cd "${pkgname}_v${pkgver//./r}-source"

  make -C bsnes
}

package() {
  cd "${pkgname}_v${pkgver//./r}-source"

  make -C bsnes prefix="${pkgdir}/usr" install
}
