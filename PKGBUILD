# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxb_pcb-git
pkgver=v1.0.2.r0.g2286db6
pkgrel=1
pkgdesc="PCB baapi back-end"
arch=('any')
url="https://gitlab.com/soft.at.home/ambiorix/modules/amxb_backends/amxb_pcb.git"
license=('MIT')

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
	'libpcb'
)
makedepends=(
)
provides=(
	'amxb_pcb'
	'amxb_pcb-git'
)
conflicts=(
	'amxb_pcb'
	'amxb_pcb-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/amxb_backends/amxb_pcb.git#branch=${gitbranch}")
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
