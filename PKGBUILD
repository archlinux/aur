# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Giorgio Gilestro <giorgio at gilest dot ro>
# Contributor: Richard Mathot <rim at odoo dot com>
_pkgbase=r8152
pkgname=${_pkgbase}-dkms
pkgver=2.10.0
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
source=(
    "https://realtekcdn.akamaized.net/rtdrivers/cn/nic/0010-${_pkgbase}.53-$pkgver.tar.bz2"
    'dkms.conf'
)
sha512sums=(
    'ac4351dee651382fc4e8b842c592b1cd9af60bf3134d105d7d3ae865daeda55e72551844a6175fffcfed2d3da2799160bbd55e269d8d265a7f814afb18ffa6c7'
    '2272d18f24a940fb878245849a0950d560b97ece8d492ebfe7ccf53f8ac6093b6b9da2b45c5ea3f99c77b36ffbd75337aa560cfd84428052f5436a9cda7c1605'
)

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
