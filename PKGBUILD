# Maintainer: Damien Guihal <dguihal at googlemail dot com>
pkgname=ngadmin-git
_pkgname=ngadmin
pkgver=r109.5bf8650
pkgrel=1
pkgdesc="An cli admin tool for some Netgear switches (the GS105E and GS108E) under a Linux OS"
arch=('i686' 'x86_64')
url="https://github.com/Alkorin/ngadmin"
license=('GPL')
source=('git+https://github.com/Alkorin/ngadmin.git')
makedepends=('git')
conflicts=('ngadmin')
provides=('ngadmin')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=${pkgdir}/usr
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
}

