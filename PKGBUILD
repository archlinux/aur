# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=go-bootstrap
_ver_num=1.4
_ver_date=20161024
pkgver=${_ver_num}.${_ver_date}
pkgrel=1
pkgdesc="The last go with a toolchain written in C, used for bootstrapping the build process for later gos"
arch=('x86_64')
url='http://golang.org/'
license=('BSD')
#depends=('')
source=("https://storage.googleapis.com/golang/go${_ver_num}-bootstrap-${_ver_date}.tar.gz")

options=('!strip' 'staticlibs')
md5sums=('76e42c8152e8560ded880a6d1d1f53cb')

prepare() {
  # don't run any tests
  sed -i 's,bash run.bash --no-rebuild,#bash run.bash --no-rebuild,g' "go/src/all.bash"  
}

build() {
  cd go/src
  CGO_ENABLED=0 ./all.bash
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/go" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:

