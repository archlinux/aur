# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=nct6775-master-dkms-git
pkgver=r159.a2a48f2
pkgrel=1
pkgdesc="Nuvoton module for nct67xx chips synced with latest upstream kernel."
arch=('i686' 'x86_64')
url="https://github.com/tonylambiris/nct6775"
license=('GPLv2')
makedepends=('git')
depends=('dkms')
source=("${pkgname}::git://github.com/tonylambiris/nct6775.git"
        "dkms.conf.in")
sha256sums=('SKIP'
            '991980f5e5d4b0c45d3b8ef823d983c1fe6059ad4f9ea462900a6d11e137ae74')

pkgver() {
	cd "${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"

	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -a LICENSE Makefile README* *.h *.c "${pkgdir}/usr/src/${pkgname}-${pkgver}"

	sed -e "s/@PACKAGE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf.in" > \
		"${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
