# Maintainer: Javs <admin@fxs.life>

pkgname=fcitx5-pangu-git
_gitname=fcitx5-pangu
pkgver=r23.bd363c7
pkgrel=1
pkgdesc="Fcitx5 module that inserts spaces between CJK and ASCII characters"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/Fei-xiangShi/fcitx5-pangu"
license=('GPL-2.0-or-later')
depends=('fcitx5')
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=('fcitx5-pangu')
conflicts=('fcitx5-pangu')
source=("${_gitname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "${srcdir}/${_gitname}" -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
