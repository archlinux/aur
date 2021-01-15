# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxb_ubus-git
pkgver=v1.0.0.r0.g22e58d7
pkgrel=1
pkgdesc="Ubus baapi back-end"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/modules/amxb_backends/amxb_ubus.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
	'libubox'
	'ubus'
)
makedepends=(
)
provides=(
	'amxb_ubus'
)
conflicts=(
	'amxb_ubus'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/amxb_backends/amxb_ubus.git#branch=${gitbranch}")
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
	make DEST="${pkgdir}/" INSTALL_LIB_DIR="/lib" install
}
