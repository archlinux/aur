# Maintainer: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes
pkgver=112
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('libpulse' 'gtksourceview2' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus')
source=("https://download.byuu.org/${pkgname}_v${pkgver//./r}-source.zip" 'package.patch')
sha256sums=('012bb38ae778ef5bc32eda067ec7b574441a0c46c4e0f612488163f3fe23e629'
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
