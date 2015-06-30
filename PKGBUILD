# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: vaca

pkgname=sascng-linux3-dkms
pkgdesc='Sasc-ng linux3 patch - dkms package'
pkgver=3.6
pkgrel=3
url='http://www.kernel.org'
license=('GPL')
depends=('linux-headers' 'dkms')
conflicts=('sascng-linux3-patch')
provides=('sascng-linux3-patch')
arch=('any')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/linux-${pkgver}.tar.bz2"
	'dkms.conf'
	'sasc-ng.patch')
sha256sums=('88ae0a20fd39ecae79db0ce8f9397922fae33c8b06a54ed2c883c861126c9771'
            '9d9a742c25a18ad5b7911baa34f9e01bdc32fa3e8f6658b8822ade7d3faefb47'
            '2c858dfab1feb50429586cd4d263be2ce4f850051ce6ebe3c2ea2e6c87ef9105')

package() {
	cd ${srcdir}/linux-${pkgver}

	patch -Np1 -i ${srcdir}/sasc-ng.patch

	mkdir -p ${pkgdir}/var/lib/dkms/sascng-linux3/${pkgver}/
	cp -r drivers/media/dvb/dvb-core ${pkgdir}/var/lib/dkms/sascng-linux3/${pkgver}/source
	sed "s/%%PKGVER%%/${pkgver}/" < ${srcdir}/dkms.conf > ${pkgdir}/var/lib/dkms/sascng-linux3/${pkgver}/source/dkms.conf
}

