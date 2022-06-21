# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.9.3
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=(any)
url=https://github.com/atar-axis/xpadneo
license=(GPL)
depends=(dkms bluez bluez-utils)
makedepends=(git)
source=(git+"${url}".git#tag=v"${pkgver}")
sha256sums=('SKIP')

package() {
	cd "${pkgname%-*}"
	cp hid-xpadneo/dkms.conf.in hid-xpadneo/dkms.conf
	sed -i 's/PACKAGE_VERSION="@DO_NOT_CHANGE@"/PACKAGE_VERSION="'"${pkgver}"'"/g' hid-xpadneo/dkms.conf
	sed -i 's@/etc/udev/rules.d@/usr/lib/udev/rules.d@g' hid-xpadneo/dkms.post_{install,remove}

	install -dm755 "${pkgdir}"/usr/src/hid-xpadneo-"${pkgver}"
	cp -rv hid-xpadneo/* "${pkgdir}"/usr/src/hid-xpadneo-"${pkgver}"
}
