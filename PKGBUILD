# Maintainer: sanpe <sanpeqf@gmail.com>
pkgname=w80xprog-git
_gitname=w80xprog
pkgver=1.0
pkgrel=1
pkgdesc="A simple command line programmer interfacing for Winner Marco 800 series chips."
arch=('i686' 'x86_64')
url="https://github.com/John-sanpe/w80xprog.git"
license=('GPL')
makedepends=('git')
source=("${_gitname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 w80xprog "${pkgdir}/usr/bin/w80xprog"
}
