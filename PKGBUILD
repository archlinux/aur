# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-keyboard
pkgver=2.1.0
pkgrel=1
pkgdesc='Virtual keyboard based on Maliit framework'
arch=(x86_64)
url='https://maliit.github.io/'
license=(LGPL)
depends=(maliit-framework hunspell presage qt5-multimedia qt5-feedback)
makedepends=(cmake libpinyin anthy libchewing)
optdepends=('anthy: japanese language support' 'libpinyin: chinese language support' 'libchewing: chinese language support')
source=(https://github.com/maliit/keyboard/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4e96b40682938edb9f4d31288d4d0154828916e02b278afcf97cd75a750ab9ef')

build() {
  cmake -B build -S keyboard-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=14 \
    -Denable-tests=OFF \
    -DHUNSPELL_DICT_PATH=/usr/share/myspell/dicts
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
