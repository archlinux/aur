# Maintainer: tinywrkb <tinywrkb@gmail.com>

_pkgname=unappimage
pkgname=${_pkgname}-git
pkgver=r1889.d7f86f2
pkgrel=1
pkgdesc="A lightweight AppImage extractor"
arch=(x86_64)
url="https://github.com/refi64/${_pkgname}"
license=('GPL2')
depends=(libelf)
makedepends=(git)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  set -o pipefail
  git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}/squashfs-tools
  make
}

package() {
  cd ${_pkgname}/squashfs-tools
  make INSTALL_DIR="$pkgdir"/usr/bin install
}
