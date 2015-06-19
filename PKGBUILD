# Maintainer: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="pesign"
pkgname="${_pkgname}-git"

pkgver=0.110.12.g8854461
pkgrel=1
pkgdesc="Tools for manipulating signed PE-COFF binaries - GIT Version"
url="https://github.com/rhinstaller/pesign"
arch=('x86_64')
license=('GPL2')
makedepends=('git')
depends=('libutil-linux' 'efivar' 'popt' 'nss')

conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

options=('!strip' '!emptydirs' 'docs')

source=("pesign::git+https://github.com/rhinstaller/pesign.git#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	echo "$(git describe --tags)" | sed -e 's|-|.|g'
}

prepare(){
	
	cd "${srcdir}/${_pkgname}/"
	
	git clean -x -d -f
	echo
	
}

build() {
	
	cd "${srcdir}/${_pkgname}/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make PREFIX="/usr/" LIBDIR="/usr/lib/"
	echo
	
}

package() {
	
	cd "${srcdir}/${_pkgname}"
	
	make INSTALLROOT="${pkgdir}/" PREFIX="/usr/" LIBDIR="/usr/lib/" install
	
	chmod 0644 "${pkgdir}/usr/lib/libdpe.a"
	rm -rf "${pkgdir}/etc/rpm/"
	
}
