# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="hws-git"
_pkgname="hws"
pkgver=0.0.1
pkgrel=1
pkgdesc="A workspace manager for hackers"
url="https://github.com/StreakyCobra/hws"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('ocaml' 'ocaml-findlib' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+http://github.com/StreakyCobra/${_pkgname}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}/"

  make
}

package() {
  cd "${srcdir}/${_pkgname}/"

  install -D -m 755 "_build/src/main.native" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=4 sw=4 et:
