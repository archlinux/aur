# Maintainer: xerus <27f at pm dot me>

_pkgname='batstat'
pkgname="${_pkgname}-git"
pkgver=r14.c04f124
pkgrel=1
pkgdesc='CLI battery status'
arch=('any')
url="https://github.com/xeruf/${_pkgname}"
license=('unknown')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('')
source=("git+${url}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}/"
  g++ main.cpp -lncurses -pthread -std=c++11 -o batstat
}

package() {
  cd "${srcdir}/${_pkgname}/"
  bin=$pkgdir/usr/bin
  mkdir -p "$bin"
  cp batstat "$bin"
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
