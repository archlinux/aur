# Maintainer: Chimmie Firefly <gameplayer2019pl (at) tutamail (dot) com>
pkgname=cubic-server-git
_pkgname=cubic-server-git
pkgver=r1442.efa5d7d4
pkgrel=1
pkgdesc='A fast and extensible C++ implementation of Minecraft is server.'

arch=(
	'i686'
	'x86_64'
	'armv7h'
	'aarch64'
	'riscv64'
)

url="https://cubic-mc.com"
license=('GPL3')

depends=(
    'openssl'
)

makedepends=(
	'git'
 	'coreutils'
 	'cmake'
 	'make'
 	'python'
 	'pkgconf'
 	'gcc'
	'python-virtualenv'
	'clang'
	'gtkmm3'
)

provides=(
	'cubic-server'
)

conflicts=(
	'cubic-server'
)

source=(
    "${pkgname}::git+https://github.com/CubicMC/cubic-server"
)

b2sums=(
    'SKIP'
)

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=RELEASE ..
	make
}

package() {
	cd "${srcdir}/${pkgname}/build"
	mkdir -p "${pkgdir}"/usr/bin
	mkdir -p "${pkgdir}"/usr/share/cubic-server
	cp -rv ./*.json "${pkgdir}/usr/share/cubic-server/"
	cp -rv ./*.gz "${pkgdir}/usr/share/cubic-server/"
	cp -rv CubicServer "${pkgdir}"/usr/bin/cubic-server
	make install DESTDIR="${pkgdir}"
}
