# Maintainer: librewish <librewish@gmail.com>
# Contributor:  Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

pkgname=rtlwifi_new-rtw88-dkms-git
_pkgname=rtlwifi_new
pkgver=r328.6dcff1c
pkgrel=1
pkgdesc='Newest Realtek rtlwifi codes, rtw88 branch'
arch=('any')
url='https://github.com/lwfinger/rtlwifi_new/tree/rtw88'
depends=('dkms')
makedepends=('git')
provides=('rtlwifi_new-dkms')
conflicts=('rtlwifi_new-dkms')
provides=('rtlwifi_new-dkms' 'rtlwifi_new-extended-dkms-git' 'rtlwifi_new-rtw88-dkms')
conflicts=('rtlwifi_new-dkms' 'rtlwifi_new-extended-dkms-git' 'rtlwifi_new-rtw88-dkms')
install=${pkgname}.install
source=("git+https://github.com/lwfinger/rtlwifi_new.git#branch=rtw88")
sha256sums=('SKIP')



pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm 755 "${pkgdir}/usr/src"
	cp -dr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	
	# Set name and version
	sed -e "s/0.6/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
	sed -e "s/rtlwifi-new/${_pkgname}/" \
                -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf	

}
