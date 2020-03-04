# Maintainer: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes
pkgver=115
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('libpulse' 'gtksourceview2' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus')
source=("https://download.byuu.org/bsnes/${pkgname}_v${pkgver//./r}-source.zip" 'package.patch')
sha256sums=('4f983feda32f5f6e494f8ea5363fc97ebfe92e0d7b78d71ebe013ed7933e2386'
            'f391b8ce83ed1dfe93d83484464613de1fa1c454d69b02c5234efc9ef69fd3bb')

prepare() {
  cd "${pkgname}_v${pkgver//./r}-source"

  patch --forward --strip=1 --input="${srcdir}/package.patch" --ignore-whitespace
}

build() {
  cd "${pkgname}_v${pkgver//./r}-source"

  make -C bsnes
}

package() {
  cd "${pkgname}_v${pkgver//./r}-source"

  make -C bsnes prefix="${pkgdir}/usr" install
}
