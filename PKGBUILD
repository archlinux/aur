# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adsklicensing
pkgver=11.0.0.4854
pkgrel=1
pkgdesc='Autodesk License Checking Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('adlmapps>=23')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://adsklicensing11.0.0.4854-0-0.x86_64.rpm'
		'adsklicensing.install')
sha256sums=('89b997e24de4477b7107867f97d0db4af8ea211106e96f14088a051f1e438f49'
			'0d478b18470f95d16a631a5a702b09e016feb435f0fef6668ce2e3a6520cde2c')

options=(!strip)
install='adsklicensing.install'

prepare() {
	# Link service program in /usr/bin/
	mkdir -p usr/bin
	ln -s /opt/Autodesk/AdskLicensing/11.0.0.4854/AdskLicensingService/AdskLicensingService usr/bin/AdskLicensingService

	# Remove init service file
	rm opt/Autodesk/AdskLicensing/11.0.0.4854/AdskLicensingService/adsklicensing.el6.conf

	# Move systemd service file
	chmod 644 opt/Autodesk/AdskLicensing/11.0.0.4854/AdskLicensingService/adsklicensing.el7.service
	mkdir -p usr/lib/systemd/system
	mv opt/Autodesk/AdskLicensing/11.0.0.4854/AdskLicensingService/adsklicensing.el7.service \
		usr/lib/systemd/system/adsklicensing.service
}

package() {
	mv opt usr $pkgdir/
}
