_pkgname=e2sim
pkgname=${_pkgname}-git
pkgver=r72.275f58f
pkgrel=1
pkgdesc="This module enables the support for running multiple terminations of an O-RAN-compliant E2 interface inside the simulation process."
arch=('x86_64')
url="https://github.com/wineslab/ns-o-ran-e2-sim"
license=('APACHE' 'BSD')
depends=('lksctp-tools')
makedepends=('cmake' 'git')
source=("${_pkgname}::git+${url}.git")

sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}/e2sim

  cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDEV_PKG=1

  cmake --build build
}

package() {
  cd ${_pkgname}/e2sim

  DESTDIR="$pkgdir" cmake --install build
}
