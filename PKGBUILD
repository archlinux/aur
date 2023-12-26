# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=btrfs-clone
pkgname=${_pkgname}-git
pkgver=r67.1354656
pkgrel=1
pkgdesc='Clone an existing BTRFS file system to a new one, cloning each subvolume in order.'
provides=(${_pkgname})
conflicts=(${_pkgname})
arch=('any')
url="https://github.com/mwilck/${_pkgname}"
license=('GPL2')
depends=()
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

_srcdir="${_pkgname}"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd "${_srcdir}"
	depends=('python' 'btrfs-progs')
	
	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
