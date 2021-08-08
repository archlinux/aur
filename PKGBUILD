# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxrt-git
pkgver=v1.1.3.r0.gb36bc57
pkgrel=1
pkgdesc="Ambiorix application runtime"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxrt.git"
license=('MIT')

depends=(
	'libevent'
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
	'lib_amxb'
	'lib_amxo'
)
makedepends=(
)
provides=(
	'amxrt'
)
conflicts=(
	'amxrt'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxrt.git#branch=${gitbranch}")
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
