# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-keyboard
pkgver=2.0.0
pkgrel=2
pkgdesc="Virtual keyboard based on Maliit framework"
arch=(x86_64)
url="https://maliit.github.io/"
license=(LGPL)
depends=(maliit-framework hunspell presage qt5-multimedia qt5-feedback)
makedepends=(cmake libpinyin anthy libchewing)
optdepends=('anthy: japanese language support' 'libpinyin: chinese language support' 'libchewing: chinese language support')
source=(https://github.com/maliit/keyboard/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c5a52898f5c0e0dd286f88f772ac251873d190b35a22d9fd387e967fbe386444')

build() {
  cmake -B build -S keyboard-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Denable-tests=OFF \
    -DHUNSPELL_DICT_PATH=/usr/share/myspell/dicts
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
