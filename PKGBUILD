# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=pcb-ser-ddw-git
pkgver=0.1.0.r0.gce0915c
pkgrel=1
pkgdesc="This library provides the code to serialize and deserialize the requests going over a PCB connection into the DDW format"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/pcb-ser-ddw.git"
license=('MIT')

depends=(
	'libsahtrace'
	'libpcb'
)
makedepends=(
	'sah_components_config'
	'm4'
	'gcc'
	'make'
	'bison'
	'flex'
)
provides=(
	'pcb-ser-ddw'
	'pcb-ser-ddw-git'
)
conflicts=(
	'pcb-ser-ddw'
	'pcb-ser-ddw-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/pcb-ser-ddw.git#branch=${gitbranch}" "components.config")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sah_components_config
	! mkdir include
	cp -f components.h include/components.h 
}

build() {
	# STAGINGDIR
	export STAGINGDIR=$(pwd)
	cd "${pkgname}"
	make clean
	make
}

package() {
	cd "${pkgname}"
	make D="${pkgdir}/" install
}
