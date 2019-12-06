# Maintainer:  Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

pkgname=rtlwifi_new-rtw88-dkms
_pkgname=rtlwifi_new
pkgver=r293.05f5504
pkgrel=1
pkgdesc='Newest Realtek rtlwifi codes, rtw88 branch'
arch=('i686' 'x86_64')
url='https://github.com/lwfinger/rtlwifi_new'
depends=('dkms')
makedepends=('git')
provides=('rtlwifi_new-dkms')
conflicts=('rtlwifi_new-dkms')
install=${pkgname}.install
source=("git+https://github.com/lwfinger/rtlwifi_new.git#branch=rtw88" 
	"dkms.conf")
sha256sums=('SKIP'
            '7152228ef9162a1a5599aab63556ff958c2447b1e2c8f896c29883694a9a5934')



pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm 755 "${pkgdir}/usr/src"
	cp -dr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	
	#fix wrong dkms config
	cp  "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
	
	# Set name and version
	sed -e "s/0.6/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
	sed -e "s/rtlwifi-new/${_pkgname}/" \
                -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf	

}
