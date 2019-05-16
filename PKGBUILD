# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Giorgio Gilestro <giorgio at gilest dot ro>
# Contributor: Richard Mathot <rim at odoo dot com>
_pkgbase=r8152
pkgname=${_pkgbase}-dkms
pkgver=2.12
pkgrel=1
pkgdesc="A kernel module for Realtek RTL8152/RTL8153 Based USB Ethernet Adapters"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
			'linux-lts-headers: Build the module for LTS Arch kernel')
source=(
    "https://github.com/wget/realtek-r8152-linux/archive/v${pkgver}.tar.gz"
    'dkms.conf'
)
sha512sums=('2722996e957b508fa8c0964ca18fc97812637e550314c8523c9d51d30237d8a84f9c4cc328f6050b5f0c9bf281badf7bbbff758bc80e2496781837ce4a2f85db'
            '2272d18f24a940fb878245849a0950d560b97ece8d492ebfe7ccf53f8ac6093b6b9da2b45c5ea3f99c77b36ffbd75337aa560cfd84428052f5436a9cda7c1605')

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
		-e "s/@PKGVER@/${_pkgbase}/g" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cp -dr --no-preserve='ownership' "realtek-${_pkgbase}-linux-${pkgver}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
