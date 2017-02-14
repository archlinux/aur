_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.044.02
pkgrel=2
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
makedepends=('linux-headers')
source=(r8168-$pkgver.tar.gz::http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0009-r8168-8.044.02.tar.bz2
        'dkms.conf')
install=r8168-dkms.install

#prepare() {
#	cd "r8168-$pkgver"
#	patch -p1 -i ../name.patch
#}
 

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
		-e "s/@PKGVER@/${_pkgbase}/g" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${_pkgbase}-$pkgver"
	rm src/Makefile_linux24x
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
sha256sums=('ad3cd1becb35efab52ed11e0326c1108806c55c62fd2b5e1cf7eaa749fb75027'
            '260d8142e944f3144cbc704534e662d427318d8b32dc7a2852a855be72e8d763')
