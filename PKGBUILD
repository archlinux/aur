# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=rtl8723ds-dkms-git
pkgver=5.1.1.5.r48.g76fb806
pkgrel=1
pkgdesc="RTL8723DS driver"
arch=('any')
url="https://github.com/lwfinger/rtl8723ds"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("rtl8723ds")
source=("git+https://github.com/lwfinger/rtl8723ds"
        "dkms.conf")
sha256sums=('SKIP'
            '13b9aecc0e40c4c0c6a1446e7ba9835d48b3f4e802a541b10ba14c7f528bde86')

pkgver() {
	cd rtl8723ds
	printf '%s.r%s.g%s' '5.1.1.5' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd rtl8723ds
	mkdir -p ${pkgdir}/usr/src/rtl8723ds-${pkgver}
	cp -pr * ${pkgdir}/usr/src/rtl8723ds-${pkgver}
	cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/rtl8723ds-${pkgver}
	# Set version in dkms.conf
	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/rtl8723ds-${pkgver}/dkms.conf
}
