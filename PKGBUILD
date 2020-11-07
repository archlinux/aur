# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=pcb-ser-odl-git
pkgver=0.1.0.r0.g34ef420
pkgrel=2
pkgdesc="This library provides the code to serialize and deserialize the data model to and from an ODL file"
arch=('any')
url="https://gitlab.com/soft.at.home/pcb/pcb-ser-odl.git"
license=('MIT')

depends=(
	'libsahtrace'
	'libpcb'
	'libusermngt'
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
	'pcb-ser-odl'
	'pcb-ser-odl-git'
)
conflicts=(
	'pcb-ser-odl'
	'pcb-ser-odl-git'
)

gitbranch="master"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/pcb/pcb-ser-odl.git#branch=${gitbranch}" "components.config")
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
