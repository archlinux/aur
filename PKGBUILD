# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=warpd-git
pkgver=r229.faa423d
_gitname=warpd
pkgrel=1
pkgdesc="A modal keyboard driven interface for mouse manipulation."
url="https://github.com/rvaiya/warpd"
license=('MIT')
arch=('x86_64')
md5sums=('SKIP')
makedepends=(git scdoc)
depends=(libxinerama libxft libxfixes libxtst libx11)
provides=(warpd)
conflicts=(warpd warpd-wayland warpd-wayland-git)
source=("git+$url")

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd ${_gitname}
  make
  make man
}

package () {
  cd ${_gitname}
  install -Dm755 -t "${pkgdir}"/usr/bin bin/warpd
  install -Dm644 files/warpd.1.gz -t "${pkgdir}"/usr/share/man/man1/
}
