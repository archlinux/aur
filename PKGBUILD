# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=waylib-git
pkgver=0.2.0.alpha1.r24.g06aaad1
pkgrel=1
pkgdesc='A wrapper for wlroots based on Qt.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/waylib"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'qwlroots' 'ninja')
provides=('waylib')
source=("git+https://github.com/vioken/waylib")
sha512sums=('SKIP')

pkgver() {
  cd waylib
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd waylib
  cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd waylib/build
  DESTDIR="$pkgdir" ninja install
}
