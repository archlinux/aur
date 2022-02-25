# Maintainer: sanpe <sanpeqf@gmail.com>
pkgname=ch552isptool-git
_gitname=ch552isptool
pkgver=r3.c6b2ce8
pkgrel=1
pkgdesc="CH552 Programming tool for Boot-loader"
arch=('i686' 'x86_64')
url="https://github.com/platunus/ch552isptool.git"
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
  install -Dm755 ch552isptool "${pkgdir}/usr/bin/ch552isptool"
}
