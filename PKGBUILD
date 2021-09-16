# Maintainer: xeruf <27f at pm dot me>

_pkgbasename='batstat'
pkgname="${_pkgbasename}-git"
pkgver=r14.c04f124
pkgrel=1
pkgdesc='CLI battery status'
arch=('any')
url="https://github.com/xeruf/${_pkgbasename}"
license=('unknown')
depends=()
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
optdepends=('')
source=("git+${url}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgbasename}/"
  g++ main.cpp -lncurses -pthread -std=c++11 -o batstat
}

package() {
  cd "${srcdir}/${_pkgbasename}/"
  sudo cp batstat /usr/bin
}

pkgver() {
  cd "${_pkgbasename}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
