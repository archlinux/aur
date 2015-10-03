# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Frank Vanderham <twelve.eighty (at) gmail.>

pkgname=broadcom-wl-dkms
_pkgname=broadcom-wl
pkgver=6.30.223.271
pkgrel=1
pkgdesc="Broadcom 802.11 Linux STA wireless driver"
arch=('i686' 'x86_64')
url="https://www.broadcom.com/support/?gid=1"
license=('custom')
depends=('dkms')
optdepends=('linux-headers: If running standard kernel, otherwise find matching headers for your kernel')
conflicts=('broadcom-wl')
backup=('etc/modprobe.d/broadcom-wl-dkms.conf')
install=broadcom-wl-dkms.install
source=('broadcom-wl-dkms.conf'
        'dkms.conf')
source_i686=("http://www.broadcom.com/docs/linux_sta/hybrid-v35-nodebug-pcoem-${pkgver//./_}.tar.gz")
source_x86_64=("http://www.broadcom.com/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")
sha256sums=('b97bc588420d1542f73279e71975ccb5d81d75e534e7b5717e01d6e6adf6a283'
            'e81085522db72b0bd6418600507c8a18202aee6dcc07b1befe16ad2e2cfbd971')
sha256sums_i686=('4f8b70b293ac8cc5c70e571ad5d1878d0f29d133a46fe7869868d9c19b5058cd')
sha256sums_x86_64=('5f79774d5beec8f7636b59c0fb07a03108eef1e3fd3245638b20858c714144be')

prepare() {
  cd "${srcdir}"

	sed -i -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" src/wl/sys/wl_linux.c
}

package() {
	cd "${srcdir}"
	
	# delete files not needed for packaging
	rm *.tar.gz

	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}

	cp -RL * ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	install -D -m 644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 broadcom-wl-dkms.conf "${pkgdir}"/etc/modprobe.d/broadcom-wl-dkms.conf
}

# vim:set ts=2 sw=2 et:
