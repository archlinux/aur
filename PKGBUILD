# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxb-git
pkgver=v3.4.2.r0.gacf5fd3
pkgrel=1
pkgdesc="Generic C-implementation for Ambiorix Backend library"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxb.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
	'uriparser'
)
makedepends=(
)
provides=(
	'lib_amxb'
)
conflicts=(
	'lib_amxb'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxb.git#branch=${gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DEST="${pkgdir}/" LIBDIR="/usr/lib" install
}
