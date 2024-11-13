# Maintainer: Lorenzo Zolfanelli <dev(at)zolfa(dot)nl>

_pkgbase="libnfc-nci-pn5xx"
_git_repo="https://github.com/StarGate01/linux_libnfc-nci"
_git_branch="master"
pkgname="${_pkgbase}-git"
pkgver=1.0.0.r74.g7ce9c8a
pkgrel=1
pkgdesc="NFC stack for NXP NFC Controllers targeting NPC300/PN548 with i2c transport"
arch=('any')
url="https://github.com/StarGate01/linux_libnfc-nci"
license=('Apache-2.0')
conflicts=('libnfc-nci-lpcusbsio' 'libnfc-nci-i2c' 'libnfc-nci-alt')
provides=("${_pkgbase}=${pkgver}")
makedepends=("git")
depends=("nxp-pn5xx-dkms")
source=("${_pkgbase}::git+${_git_repo}#branch=${_git_branch}")
sha256sums=('SKIP')

build() {
	cd ${_pkgbase}
	./bootstrap
	./configure --enable-i2c --sysconfdir=/etc --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd ${_pkgbase}
	make DESTDIR="$pkgdir/" install
}


pkgver() {
	cd ${srcdir}/${_pkgbase}
	printf '%s.r%s.g%s' '1.0.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
