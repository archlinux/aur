#Maintainer: Alexander Sobolevkiy <smak.nsk [at] gmail [dot] com>

pkgname=aerospike-amc-community
pkgrealname=aerospike-tools
pkgver=4.0.15
pkgrel=1
pkgdesc="Aerospike Management Console (AMC) is a web-based tool to monitor/manage an Aerospike cluster"
arch=('x86_64')
url="https://www.aerospike.com/download/amc/"
license=('AGPLv3')
sha256sums=('9d0533f344b325a91d1a3e0c6c5c73226fdcdc5fb2b3c33766e539ec1923598d')
source=("http://www.aerospike.com/download/amc/${pkgver}/artifact/linux")

package() {
	mkdir -p -m 755 "${pkgdir}/etc/amc/"
	mkdir -p -m 755 "${pkgdir}/opt/amc/"
	mkdir -p -m 755 "${pkgdir}/var/log/amc/"
	
	install -m 0644 ${srcdir}/etc/amc/amc.conf "${pkgdir}/etc/amc/"
	
	for path in $(find opt/ | sort); do
		if [ -d ${path} ]; then
			mkdir -p -m 755 "${pkgdir}/${path}"
		else
			install -m 0644 $path "${pkgdir}/${path}"
		fi
	done
	
	chmod +x ${pkgdir}/opt/amc/amc
	
	# Systemd
	install -m755 -d ${pkgdir}/usr/lib/systemd/system
	install -m644  ${startdir}/amc.service ${pkgdir}/usr/lib/systemd/system
}