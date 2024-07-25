# Maintainer: xeruf <27jf at pm dot me>

_pkgname='cpub'
pkgname="${_pkgname}-git"
pkgver=r6.e6582ad
pkgrel=1
pkgdesc='ncurses based epub reader for the command line'
arch=('any')
url="https://github.com/udiboy1209/${_pkgname}"
license=(unknown)
depends=(python-bs4)
provides=("${_pkgname}")
conflicts=()
optdepends=()
source=("git+${url}")
sha512sums=('SKIP')

package() {
  set -x
  cd "${srcdir}/${_pkgname}/"
  install -D --target-directory "${pkgdir}/usr/bin" cpub
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
