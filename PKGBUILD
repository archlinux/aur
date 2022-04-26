# Maintainer: akasaka <vladkorotnev at gmail dot com>

_pkgname=resource_dasm
pkgname=${_pkgname}-git
provides=("${_pkgname}")
pkgver=r573.7c34c83
pkgrel=1
pkgdesc="Classic Mac OS resource fork and application disassembler, with reverse-engineering tools for specific applications"
arch=('x86_64')
license=('MIT')
url="https://github.com/fuzziqersoftware/resource_dasm"
depends=('netpbm')
makedepends=('git' 'cmake' 'phosg')
source=('git+https://github.com/fuzziqersoftware/resource_dasm.git')
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  cmake .
}


pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
}
