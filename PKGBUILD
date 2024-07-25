# Maintainer: Matthias Gerstner <matthias.gerstner@nefkom.net>

pkgname='libcosmos'
pkgver=v0.2.2
pkgrel=1
pkgdesc='A library providing a modern C++ API for the Linux operating system'
arch=('i686' 'x86_64')
url='https://github.com/gerstner-hub/libcosmos'
license=('MIT')
_tag='52f2ea56d261441b0914d0be4f86232ec1ad20a5' # v0.2.2
source=("git+${url}.git?signed#tag=$_tag")
sha256sums=('SKIP')
depends=('glibc' 'gcc-libs')
makedepends=('scons')
# retrieve key for verification from PGP keyserver, or from gibhub.com/gerstner-hub.gpg
validpgpkeys=('40C89F006FB8A328B83A37CC14AD6F6579097284')

pkgver() {
	cd "$pkgname"
	git describe
}

build() {
	cd "${srcdir}/${pkgname}"
	scons
}

check() {
	cd "${srcdir}/${pkgname}"
	scons run_tests
}

package() {
	cd "${srcdir}/${pkgname}"
	scons install instroot="${pkgdir}/usr"
	local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "$licensedir"
	cp LICENSE "$licensedir"
}
