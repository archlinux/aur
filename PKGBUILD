# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
_pkgbase=r8152
pkgname=${_pkgbase}-dkms
pkgver=2.07.0
pkgrel=2
pkgdesc="A kernel module for Realtek 8152 network adapters"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
			'linux-lts-headers: Build the module for LTS Arch kernel')
#install=$pkgname.install
source=(http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0005-${_pkgbase}.53-$pkgver.tar.bz2
        'dkms.conf')
sha256sums=('cabefb22eef081a2d34088322efc9f1ac55b73978965eb24643a8037837d8b7b'
            '236d6d0b7caea466b107251c0c898fc7286999ae9eab04800a97125f3b719392')

prepare() {
	cd "r8152-$pkgver"
}
 

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
		-e "s/@PKGVER@/${_pkgbase}/g" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	#cd "${_pkgbase}-$pkgver"
	#rm src/Makefile_linux24x
	cp -dr --no-preserve='ownership' "${_pkgbase}-$pkgver" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
