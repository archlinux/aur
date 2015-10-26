_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.040.00
pkgrel=7
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
			'linux-lts-headers: Build the module for LTS Arch kernel')
install=$pkgname.install
source=(https://github.com/mtorromeo/r8168/archive/$pkgver/$_pkgbase-$pkgver.tar.gz dkms.conf)
sha256sums=('1f7aad3a066c152837e03e558ba720742e792d281c96c5412cff32d68875415b' '260d8142e944f3144cbc704534e662d427318d8b32dc7a2852a855be72e8d763')

package() {
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
		-e "s/@PKGVER@/${pkgver}/g" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "$_pkgbase-$pkgver"
	rm src/Makefile_linux24x
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
