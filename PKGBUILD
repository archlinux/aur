# Maintainer : Keshav Amburay <(the ddoott ridikulusddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_pkgname="efibootmgr"
pkgname="${_pkgname}-git"

_gitroot="https://github.com/vathpela/efibootmgr.git"
_gitname="${_pkgname}"
_gitbranch="master"

pkgver=0.6.1.29.gf4e29e4
pkgrel=1
pkgdesc="Tool to modify UEFI Firmware Boot Manager Variables - GIT master branch"
arch=('x86_64' 'i686')
url="https://github.com/vathpela/efibootmgr"
license=('GPL2')
makedepends=('git')
depends=('pciutils' 'efivar' 'zlib')
conflicts=("${_pkgname}" "${_pkgname}-pjones" "${_pkgname}-pjones-git")
provides=("${_pkgname}=${pkgver}" "${_pkgname}-pjones=${pkgver}" "${_pkgname}-pjones-_git=${pkgver}")
options=('!strip' 'zipman' '!emptydirs' '!libtool')

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|-|\.|g'
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	make EXTRA_CFLAGS="-Os"
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	install -d "${pkgdir}/usr/bin/"
	install -D -m0755 "${srcdir}/${_gitname}_build/src/efibootmgr/efibootmgr" "${pkgdir}/usr/bin/efibootmgr"
	
	install -d "${pkgdir}/usr/share/man/man8/"
	install -D -m0644 "${srcdir}/${_gitname}_build/src/man/man8/efibootmgr.8" "${pkgdir}/usr/share/man/man8/efibootmgr.8"
	
}
