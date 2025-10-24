# Maintainer: Javs <admin@fxs.life>

pkgname=fcitx5-pangu-git
_gitname=fcitx5-pangu
pkgver=0.8
pkgrel=1
pkgdesc="pangu module for fcitx5, insert space between CJK and alphabet characters"
arch=('x86_64' 'aarch64' 'i686')
license=('GPL-2.0-or-later')
depends=('fcitx5')
makedepends=('cmake' 'git' 'extra-cmake-modules')
url="https://github.com/Fei-xiangShi/fcitx5-pangu"
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_gitname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="${pkgdir}" cmake --install build
}
