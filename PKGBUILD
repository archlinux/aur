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
makedepends=('asciidoctor' 'git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/cs50/libcs50.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"

  git describe --tags --long           \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed 's/v//'
}

build() {
  cd "${_gitname}"

  make
}

package() {
  cd "${_gitname}"

 install -d "${pkgdir}/usr"
 install -d "${pkgdir}/usr/share/man/man3"
 cp -rp build/* "${pkgdir}/usr/"
 cp -rp debian/docs/* "${pkgdir}/usr/share/man/man3/"
}

# vim: ts=2 sw=2 et:
