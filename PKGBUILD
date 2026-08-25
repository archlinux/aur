pkgname=td-fcitx5-rime-git
pkgver=r375.f786331
pkgrel=1
pkgdesc="RIME input method for fcitx5 (tiandic modified version)"
arch=('i686' 'x86_64')
url="https://github.com/tiandic/fcitx5-rime"
license=('LGPL')
options=(!debug)
depends=('boost-libs' 'curl' 'fcitx5-git' 'librime' 'opencc' 'librime-data')
makedepends=('boost' 'extra-cmake-modules' 'git')
conflicts=('fcitx-rime' 'fcitx5-rime')
provides=('fcitx5-rime')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd fcitx5-rime
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd fcitx5-rime
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  make
}

package() {
  cd fcitx5-rime
  make DESTDIR="$pkgdir" install
}
