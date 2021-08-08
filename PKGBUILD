# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=mod_dmext_cli-git
pkgver=v0.1.2.r0.g6ab410b
pkgrel=1
pkgdesc="Module Data Model Extension"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/modules/mod-dmext.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxo'
	'lib_amxd'
)
makedepends=(
)
provides=(
	'mod_dmext'
)
conflicts=(
	'mod_dmext'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/mod-dmext.git#branch=${gitbranch}")
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
