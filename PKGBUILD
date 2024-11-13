# Maintainer: Lorenzo Zolfanelli <dev(at)zolfa(dot)nl>

_pkgbase="libnfc-nci-pn5xx"
_git_repo="https://github.com/StarGate01/linux_libnfc-nci"
_git_branch="master"
pkgname="${_pkgbase}-git"
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux NFC stack for NCI based NXP NFC Controllers (PN7150, PN7120). For i2c transport. Patched for Thinkpad NPC300/PN548 NXP I2C module."
arch=('any')
url="https://github.com/StarGate01/linux_libnfc-nci"
license=('GPL2')
conflicts=('libnfc-nci-lpcusbsio' 'libnfc-nci-i2c' 'libnfc-nci-alt')
makedepends=("git")
depends=("nxp-pn5xx-dkms-git")
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
