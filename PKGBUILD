pkgname=warpd-wayland-git
pkgver=r231.567205b
_gitname=warpd
pkgrel=1
pkgdesc="A small program which facilitates recursively warping the pointer to different quadrants on the screen (wayland build)."
url="https://github.com/rvaiya/warpd"
license=('MIT')
arch=('x86_64')
md5sums=('SKIP')
makedepends=(git)
depends=(wayland libxkbcommon cairo)
provides=(warpd)
source=("git+$url")

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd ${_gitname}
  export PLATFORM=wayland
  make
}

package () {
  cd ${_gitname}
  install -Dm755 -t "${pkgdir}"/usr/bin bin/warpd
  mkdir -p "${pkgdir}"/usr/share/man/man1/
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1/ files/warpd.1.gz
}
