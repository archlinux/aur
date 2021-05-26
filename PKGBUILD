# Maintainer: cable_loco <el_gordo_usa@hotmail.com>
# Contributor: BlackyFox <blacky@blackyfox.net>
pkgname=purevpn
pkgver=1.2.5
pkgrel=2
pkgdesc="PureVPN Linux Application (CLI). World's Fastest, Most Reliable and Easy to Use VPN service."
arch=('i686' 'x86_64')
url="https://www.purevpn.com"
license=('custom')
options=('!strip' '!emptydirs')
depends=('net-tools')
makedepends=('tar')
conflicts=('purevpn-networkmanager')
install=${pkgname}.install
source=("purevpn.service")
source_i686=("${pkgname}_${pkgver}_i386.deb::https://d3uym7n1flvv1x.cloudfront.net/linux/app/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb::https://d3uym7n1flvv1x.cloudfront.net/linux/app/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('cc02e6062c8cd9b44662bc0317b9f1ac49971db3e41970236ab0dc2ec7dbd48065f262c5fea4b07b0ddd5dbd4e7288e23b05f8711d913ed94e6a51959375fc83')
sha512sums_i686=('9bf34048d4b4ae62ea9ff6870e0c44621ebca029d2227f12364a7abd9eb969c0653509eaef52f7cad9bcae94bd6ceb40f4b231db6f22bb60fbb18167b7fe7d3f')
sha512sums_x86_64=('7d9b31f3268c41905b81fa87d14e411df959e03a4dcae556b653b34fd310ab69a07d1d7af8d2ef27a12726697f561a2f78ca29a975827eb5756c1fbc219cf670')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"
	
	#Move sbin to bin and Clean uneeded folders
	mv usr/sbin/* usr/bin
	rm -Rf usr/sbin
	rm -Rf usr/lib/${pkgname}
	rm etc/purevpn/ifconfig
	rm etc/purevpn/route
	
	#Install systemd config files
	install -D -m 644 "${srcdir}"/purevpn.service "${pkgdir}"/usr/lib/systemd/system/purevpn.service

	#Install Licence
	install -D -m644 "usr/share/doc/purevpn/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
