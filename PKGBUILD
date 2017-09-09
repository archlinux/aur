# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='libcs50-git'
_gitname='libcs50'
pkgver=8.0.5.r33.g80275e4
pkgrel=1
pkgdesc="CS50 Library for C"
arch=('x86_64' 'i686')
url="https://cs50.harvard.edu/"
license=('unknown')
groups=('cs50')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/cs50/libcs50.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"

  git describe --tags --long           \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed 's/v//'                      \
    | sed 's/deb//'
}

build() {
  cd "${_gitname}"

  make build
}

package() {
  cd "${_gitname}"

  install -d -m 755 "${pkgdir}/usr/"
  cp -rp build/* "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
