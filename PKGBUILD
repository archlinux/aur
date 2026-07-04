# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: Kenneth Hunter <kennethdhunter at gmail dot com>

_pkgbase=mt76
pkgname=mt76-dkms-git
pkgver=r4802.215a7025
pkgrel=1
pkgdesc="Linux drivers for Mediatek wireless chips"
arch=('any')
url="https://github.com/morrownr/mt76"
license=('GPL')
makedepends=('git')
depends=('dkms' 'linux-firmware-mediatek')
source=("git+https://github.com/morrownr/mt76.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgbase}"
	install -dm755 "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
	git archive --format=tar HEAD | tar -C "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" -xf -
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d mt76_git.conf
	sed -e "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/g" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

