# Maintainer: Adam Nielsen <malvineous@shikadi.net>
#
# Example use:
#
# To try ALL MIBs:
#   snmpwalk -v1 -c public -m ALL mydrac 1
#
# To use just the DRAC MIBs:
#   snmpwalk -v1 -c public -m +DELLRAC-MIB:IDRAC-MIB-SMIv2 mydrac 1.3.6.1.4.1
#
# To get a single value:
#   snmpget -v1 -c public -m +IDRAC-MIB-SMIv2 mydrac IDRAC-MIB-SMIv2::systemServiceTag.0
#

pkgname=('dell-drac-mibs')
pkgver=9.4.0
pkgrel=1
pkgdesc='SNMP MIBs for Dell iDRAC remote management controllers'
arch=('any')
url='https://www.dell.com/support/home/en-au/drivers/driversdetails?driverid=cfpyt'
license=('custom:dell')
depends=('net-snmp')
makedepends=('unzip')
source=('https://dl.dell.com/FOLDER06009600M/1/Dell-OM-MIBS-940_A00.zip')
md5sums=('37457f62bd6e1d66d952d7c7ac788dc6')
sha256sums=('943dfd24cd64eb5e300d33d115f20dbdfc314590d6747c954e076c22cb974407')

package() {
	numfiles=(Dell*.zip)
	numfiles=${#numfiles[@]}
	if [ "$numfiles" -gt 1 ]; then
		error "Please remove the src/ folder left over from a previous build"
		exit 1
	fi
	unzip -jo Dell*.zip
	install -Dm0644 *.mib *.txt -t "$pkgdir/usr/share/snmp/mibs/"
	rm "$pkgdir/usr/share/snmp/mibs/"*readme*
	install -Dm0644 *readme* -t "$pkgdir/usr/share/doc/dell-drac-mibs/"
}
