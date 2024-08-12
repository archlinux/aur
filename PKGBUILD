# Maintainer: Rihards Skuja <rihards at skuja dot eu>

pkgname=rtl8812au-openhd-dkms-git
_modname=88XXau_ohd
pkgver=5.2.20.2.r878.gc070e02
_pkgver=5.2.20.2
pkgrel=6
pkgdesc='Realtek RTL88xxAU WiFi USB driver (with OpenHD patches)'
arch=(any)
url='https://github.com/OpenHD/rtl8812au'
license=(GPL2)
depends=('dkms' 'bc')
makedepends=('git')
source=('git+https://github.com/OpenHD/rtl8812au.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/rtl8812au"
	printf '%s.r%s.g%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}/rtl8812au"
	mkdir -p "${pkgdir}/usr/src/${_modname}-${pkgver}"
	cp -pr * "${pkgdir}/usr/src/${_modname}-${pkgver}"
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
