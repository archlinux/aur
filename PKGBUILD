# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=xiringuito
pkgver=0.2.1
pkgrel=1
pkgdesc='SSH-based "VPN for poors"'
arch=('x86_64')
url='https://github.com/ivanilves/xiringuito'
license=('Apache-2.0')
makedepends=('make')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('0304ee106d8d1588b05a671846e7836e')

package() {
	cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/xiringuito"
	mkdir -p "${pkgdir}/usr/bin"
	sed -i "1s|/usr/local/xiringuito|${pkgdir}/usr/share/xiringuito|" Makefile
	sed -i "2s|/usr/local/bin|${pkgdir}/usr/bin|" Makefile
	make INSTALL_ROOT="${pkgdir}" install
	rm "${pkgdir}/usr/share/xiringuito/Makefile"
	sed -i "s|${pkgdir}||" ${pkgdir}/usr/bin/*
}
# vim:set ts=2 sw=2 et: