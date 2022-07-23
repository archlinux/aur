# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=btrfs-clone
pkgname=${_pkgname}-git
pkgver=r58.53ec587
pkgrel=1
pkgdesc='Clone an existing BTRFS file system to a new one, cloning each subvolume in order.'
provides=(${_pkgname})
conflicts=(${_pkgname})
arch=('any')
url="https://github.com/mwilck/${_pkgname}"
license=('GPL2')
depends=('python')
makedepends=('git')
source=(
	"git+${url}.git"
	"${url}/pull/10.patch"
	"${url}/pull/20.patch"
	"${url}/pull/21.patch")
sha256sums=('SKIP'
            'ad90a81995d6027d71a96ecb9504a459161beb61b1630eaf801aa36c8a6b7d5c'
            '441843fc414cff858a4039b63a5787dea5cbb5fd4065fbd41cd24983c4e1844b'
            '078c3803c4d31d64e71bb93f803ac5ed9d99f3db14ad367c544ef8e175e84f31')

_srcdir="${_pkgname}"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${_srcdir}"
	
	patch -p1 -i '../10.patch'
	patch -p1 -i '../20.patch'
	patch -p1 -i '../21.patch'
}

package() {
	cd "${_srcdir}"
	
	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
