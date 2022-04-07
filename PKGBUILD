# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-keyboard
pkgver=2.2.1.1
pkgrel=1
pkgdesc='Virtual keyboard based on Maliit framework'
arch=(x86_64)
url='https://maliit.github.io/'
license=(LGPL)
depends=(maliit-framework hunspell presage qt5-multimedia qt5-feedback)
makedepends=(cmake libpinyin anthy libchewing)
optdepends=('anthy: japanese language support' 'libpinyin: chinese language support' 'libchewing: chinese language support')
source=(https://github.com/maliit/keyboard/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('32f2fd97fc025c686fbe6fbe9af2b7b751aa9453f3deee668d65a5626e2d4da9')
options=(debug)

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
