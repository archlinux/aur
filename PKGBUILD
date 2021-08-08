# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=python3_ambiorix_bindings-git
pkgver=v0.2.3.r0.gaf7afab
pkgrel=1
pkgdesc="Python3 AMX Language Bindings"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/bindings/python3.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxb'
	'lib_amxd'
	'libevent'
	'python'
)
makedepends=(
)
provides=(
	'python3_ambiorix_bindings'
)
conflicts=(
	'python3_ambiorix_bindings'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/bindings/python3.git#branch=${gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	export CFLAGS="${CFLAGS} -I$(realpath ../include)"
	make
}

package() {
	cd "${pkgname}"
	make DEST="${pkgdir}/" LIBDIR="/usr/lib" install
}
