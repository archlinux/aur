# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=cc-tool-git
_pkgver=0.26
pkgver=0.26.r20.0bde010
pkgrel=1
pkgdesc="Support for Texas Instruments CC Debugger"
arch=('x86_64')
url='https://github.com/dashesy/cc-tool.git'
license=('GPL')
depends=('boost>=1.39')
provides=('cc-tool')
conflicts=('cc-tool')
source=( "${pkgname}::git+https://github.com/dashesy/cc-tool.git#branch=master" )
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./bootstrap
  ./configure --prefix=/usr CPPFLAGS=-P
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
