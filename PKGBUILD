# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Yangtse Su <i@yangtse.me>

pkgname=xpadneo-dkms
pkgver=0.8.2
pkgrel=1
pkgdesc='Advanced Linux Driver for Xbox One Wireless Gamepad'
arch=(any)
url=https://github.com/atar-axis/xpadneo
license=(GPL)
depends=(dkms bluez bluez-utils)
makedepends=(git)
source=(git+"${url}".git#commit=b0e1192f3385e2c9161970b9575ea9f1d930498d?signed) # `git rev-list -n 1 v$pkgver`
validpgpkeys=(F846887B36EA14F44D73E668046FAC3028D76321) # Kai Krakow 
sha256sums=(SKIP)

package() {
	cd "${pkgname%-*}"
	sed -i 's/PACKAGE_VERSION="@DO_NOT_CHANGE@"/PACKAGE_VERSION="'"${pkgver}"'"/g' hid-xpadneo/dkms.conf
	sed -i 's/#define DRV_VER "@DO_NOT_CHANGE@"/#define DRV_VER "'"${pkgver}"'"/g' hid-xpadneo/src/hid-xpadneo.c
	sed -i 's@/etc/udev/rules.d@/usr/lib/udev/rules.d@g' hid-xpadneo/dkms.post_install hid-xpadneo/dkms.post_remove

	install -dm755 "${pkgdir}"/usr/src/hid-xpadneo-"${pkgver}"
	cp -r hid-xpadneo/* "${pkgdir}"/usr/src/hid-xpadneo-"${pkgver}"
}
