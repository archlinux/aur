# Maintainer: Johan Sköld <johan@git.skold.cc>

_pkgname=xpad-noone
pkgname="${_pkgname}-git"
pkgver=r8.6970c40
pkgrel=1
pkgdesc='This is the original upstream xpad driver from the Linux kernel with support for Xbox One controllers removed.'
arch=('x86_64' 'aarch64')
url='https://github.com/medusalix/xpad-noone'
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=('xpad-dkms-git')
provides=('xpad-noone')
source=(
	"${_pkgname}::git+${url}.git"
	'modprobe.conf')
sha256sums=(
	'SKIP'
	'bdc54ef5b9728751f89f08039c69141f7515b9df723cbda1df0239c5109d249b')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d -m 755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	find "${srcdir}/${_pkgname}" -maxdepth 1 -type f -exec install -D -m 644 {} "${pkgdir}/usr/src/${pkgname}-${pkgver}" \;
	install -D -m 644 "${srcdir}/modprobe.conf" "${pkgdir}/usr/lib/modprobe.d/xpad-noone-git-modprobe.conf"
}

