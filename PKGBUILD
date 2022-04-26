# Maintainer: akasaka <vladkorotnev at gmail dot com>

_pkgname=phosg
pkgname=${_pkgname}-git
provides=("${_pkgname}")
pkgver=r302.b984d1b
pkgrel=1
pkgdesc="C++ helpers library for some common tasks"
arch=('x86_64')
license=('MIT')
url="https://github.com/fuzziqersoftware/phosg"
depends=()
makedepends=('git' 'cmake' 'python')
source=('git+https://github.com/fuzziqersoftware/phosg.git#commit=b984d1b4903ef1ef0c6ac539ec5c4a63924cc86b')
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
  make test
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make install
}
