# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-keyboard
pkgver=2.3.1
pkgrel=2
pkgdesc='Virtual keyboard based on Maliit framework'
arch=(x86_64)
url='https://maliit.github.io/'
license=(LGPL)
depends=(maliit-framework hunspell presage qt5-multimedia qt5-quickcontrols2 qt5-feedback)
makedepends=(cmake libpinyin anthy libchewing)
optdepends=('anthy: japanese language support' 'libpinyin: chinese language support' 'libchewing: chinese language support')
source=(https://github.com/maliit/keyboard/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c3e1eb985b8ae7ce4e3e28412b7e797ff5db437ccd327e0d852a3c37f17fe456')

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
