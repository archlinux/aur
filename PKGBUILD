# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=warpd-git
pkgver=r238.6ece9f2
_gitname=warpd
pkgrel=2
pkgdesc="A modal keyboard driven interface for mouse manipulation."
url="https://github.com/rvaiya/warpd"
license=('MIT')
arch=('x86_64')
md5sums=('SKIP')
makedepends=(git)
depends=(libxinerama libxft libxfixes libxtst libx11 libxkbcommon cairo)
optdepends=('wayland: wayland support')
provides=(warpd)
conflicts=(warpd warpd-wayland warpd-wayland-git)
source=("git+$url")

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i 's/input_evnet/input_event/' warpd/src/platform/linux/X/input.c
}

build () {
  cd ${_gitname}
  make
}

package () {
  cd ${_gitname}
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
