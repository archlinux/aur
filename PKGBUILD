# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sergey Musiyenko <m@sy.mk>
pkgname=st-musiyenko-git
_pkgname=st-musiyenko
pkgver=0.8.4.r8.c4f8695
pkgrel=1
pkgdesc="Simple terminal implementation for X"
arch=('i686' 'x86_64')
url="https://github.com/musiyenko/st"
license=('MIT')
depends=('libxft')
makedepends=('git' 'ncurses' 'libxext')
provides=('st')
conflicts=('st')
source=("${_pkgname}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
}

build() {
	cd "${_pkgname}"
  	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
