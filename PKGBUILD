# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-keyboard
pkgver=2.2.0
pkgrel=1
pkgdesc='Virtual keyboard based on Maliit framework'
arch=(x86_64)
url='https://maliit.github.io/'
license=(LGPL)
depends=(maliit-framework hunspell presage qt5-multimedia qt5-feedback)
makedepends=(cmake libpinyin anthy libchewing)
optdepends=('anthy: japanese language support' 'libpinyin: chinese language support' 'libchewing: chinese language support')
source=(https://github.com/maliit/keyboard/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('bc6320c82f5614f710ff5f7ace6aa903cadf33655ce171d15ba29544e07a4803')
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
