# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Based on: huawei-wmi-dkms by ylxdzsw

_pkgbase="huawei-wmi"
pkgname="${_pkgbase}-dkms-kbdlight-git"
pkgver=3.3.r12.gc142bce
pkgrel=1
pkgdesc="Huawei WMI laptop extras driver (feat/kbdlight branch)"
url="https://github.com/sermart1234/Huawei-WMI"
arch=('x86_64')
license=('GPLv2')
depends=('dkms')
source=("${_pkgbase}::git+https://github.com/aymanbagabas/Huawei-WMI#branch=feat/kbdlight")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgbase}"
	# cutting off 'v' prefix that presents in the git tag
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_pkgbase}/dkms"
	dir="$(ls | tail -1)"
	cd "$dir"
	install -Dm644 'dkms.conf' 'Makefile' '../../huawei-wmi.c' -t "${pkgdir}/usr/src/${dir}"
}
