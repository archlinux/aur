# Maintainer: sanpe <sanpeqf@gmail.com>
pkgname=coremark-git
_gitname=coremark
pkgver=r50.45faaf8
pkgrel=1
pkgdesc="CoreMark® is an industry-standard benchmark that measures the performance of central processing units (CPU) and embedded microcrontrollers (MCU)."
arch=(any)
url="https://github.com/eembc/coremark.git"
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
  make compile
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 coremark.exe "${pkgdir}/usr/bin/coremark"
}
