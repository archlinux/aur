# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=check-nwc-health
pkgver=11.0.1.1
pkgrel=2
pkgdesc="Monitoring check for various network equipment"
arch=('any')
url='https://labs.consol.de/nagios/check_nwc_health/'
license=('GPL')
depends=('perl' 'perl-json' 'perl-json-xs' 'perl-file-slurp')
makedepends=()
optdepends=('perl-net-snmp: checks based on SNMP'
            'perl-soap-lite: checks based on UPnP'
            'perl-xml-libxml: checks based on UPnP'
            'perl-xml-treebuilder: FritzBox checks')
source=("https://labs.consol.de/assets/downloads/nagios/check_nwc_health-$pkgver.tar.gz")
sha256sums=('b6a3d681095bee90a677578d6326fcb6f09a88997da734efd9d35e40f1900a04')

build() {
	cd "check_nwc_health-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins
	make
}

check() {
	cd "check_nwc_health-$pkgver"
	./plugins-scripts/check_nwc_health --help > /dev/null
}

package() {
	cd "check_nwc_health-$pkgver"
	make DESTDIR="$pkgdir/" install
}
