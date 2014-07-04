# Maintainer : Keshav Amburay <(the ddoott ridikulusddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname="efibootmgr"
pkgname="${_pkgname}-git"

pkgver=0.7.0.8.g15a46a8
pkgrel=1
pkgdesc="Tool to modify UEFI Firmware Boot Manager Variables - GIT master branch"
arch=('x86_64' 'i686')
url="https://github.com/vathpela/efibootmgr"
license=('GPL2')
makedepends=('git')
depends=('pciutils' 'efivar' 'zlib')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
options=('!strip' 'zipman' 'docs' '!emptydirs')

source=("${_pkgname}::git+https://github.com/vathpela/efibootmgr.git#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	echo "$(git describe --tags)" | sed -e 's|efibootmgr-||g' -e 's|-|\.|g'
}

prepare() {
	
	rm -rf "${srcdir}/${_pkgname}_build/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}_build"
	
	cd "${srcdir}/${_pkgname}_build/"
	
	git clean -x -d -f
	echo
	
}

build() {
	
	cd "${srcdir}/${_pkgname}_build/"
	
	make EXTRA_CFLAGS="-Os"
	echo
	
}

package() {
	
	cd "${srcdir}/${_pkgname}_build/"
	
	install -d "${pkgdir}/usr/bin/"
	install -D -m0755 "${srcdir}/${_pkgname}_build/src/efibootmgr/efibootmgr" "${pkgdir}/usr/bin/efibootmgr"
	
	install -d "${pkgdir}/usr/share/man/man8/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/src/man/man8/efibootmgr.8" "${pkgdir}/usr/share/man/man8/efibootmgr.8"
	
}
