# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_gitname="efibootmgr"

_pkgname="efibootmgr"
pkgname="${_pkgname}-git"

pkgver=0.6.0.1.gf38f4aa
pkgrel=1
pkgdesc="Tool to modify UEFI Firmware Boot Manager Variables - GIT Version"
arch=('x86_64' 'i686')
url="http://linux.dell.com/git/efibootmgr.git"
license=('GPL2')
makedepends=('git')
depends=('pciutils')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(strip purge docs zipman !emptydirs !libtool)

source=('efibootmgr::git+git://linux.dell.com/efibootmgr.git#branch=master')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --always | sed 's|Release_||g' | sed 's|_|.|g' | sed 's|-|.|g'
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
