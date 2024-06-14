# Maintainer: Rihards Skuja <rihards at skuja dot eu>

pkgname=rtl88x2bu-openhd-dkms-git
_modname=88x2bu_ohd
pkgver=5.13.1.r229.g0f4686b
_pkgver=5.13.1
pkgrel=7
pkgdesc='Realtek RTL88x2BU WiFi USB driver (with OpenHD patches)'
arch=(any)
url='https://github.com/OpenHD/rtl88x2bu'
license=(GPL2)
depends=(dkms bc)
makedepends=(git)
source=('git+https://github.com/OpenHD/rtl88x2bu.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/rtl88x2bu"
	printf '%s.r%s.g%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}/rtl88x2bu"
	mkdir -p "${pkgdir}/usr/src/${_modname}-${pkgver}"
	cp -pr * "${pkgdir}/usr/src/${_modname}-${pkgver}"
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
	mkdir -p "${pkgdir}/usr/lib/modprobe.d/"
	echo "blacklist rtw88_8822bu" > "${pkgdir}/usr/lib/modprobe.d/rtw8822bu.conf"
}
