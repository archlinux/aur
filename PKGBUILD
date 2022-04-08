# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adsklicensing
pkgver=12.0.0.6537
pkgrel=1
pkgdesc='Autodesk License Checking Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('adlmapps>=25')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adsklicensing${pkgver}-0-0.x86_64.rpm"
		'adsklicensing.install')
sha256sums=('3da597e0670a47bd2b3261011feb82ba2d218980c86ecc665f3a4968a943fad8'
			'0d478b18470f95d16a631a5a702b09e016feb435f0fef6668ce2e3a6520cde2c')

options=(!strip)
install='adsklicensing.install'

prepare() {
	# Link service program in /usr/bin/
	mkdir -p usr/bin
	ln -s /opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/AdskLicensingService usr/bin/AdskLicensingService

	# Remove init service file
	rm opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/adsklicensing.el6.conf

	# Move systemd service file
	chmod 644 opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/adsklicensing.el7.service
	mkdir -p usr/lib/systemd/system
	mv opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/adsklicensing.el7.service \
		usr/lib/systemd/system/adsklicensing.service
}

package() {
	mv opt usr $pkgdir/
}
