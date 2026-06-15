# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='inherit-acl'
_pkgverUpstream="0.1.3"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=3
pkgdesc="Tool that applies to a path its parent directory's permissions and ACL"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/inherit-acl/'
license=('GPL-3.0-only')
depends=('bash>=4.3' 'coreutils' 'sed' 'acl')
optdepends=('sudo: Sudo integration')
source=("https://www.eomanis.dedyn.io/permshare/inherit-acl/inherit-acl-${_pkgverUpstream}.tar.gz"
        "https://www.eomanis.dedyn.io/permshare/inherit-acl/inherit-acl-${_pkgverUpstream}.tar.gz.asc")
sha384sums=('905bdc59b7babd0a414683143777d54a830297310bbcfee6815d364bd3a679a75eb2b6241c1fa8bd4e031dc05d9bbd2f'
            'SKIP')
validpgpkeys=('F57637E9E5C28F91EE64277B603EEF8FE0A99498') # eomanis <eomanis at web dot de>

package() {
	local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

	# Create a bunch of directories
	install --mode=u=rwx,go=rx --directory \
		"${pkgdir}/usr/bin"

	# Place some files
	install --mode=u=rwx,go=rx --target-directory="${pkgdir}/usr/bin" -- \
		"${srcRootDir}/inherit-acl" \
		"${srcRootDir}/inherit-acl-run"
}
