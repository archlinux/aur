# Maintainer: BlackyFox <blacky@blackyfox.net>
pkgname=purevpn
pkgver=1.2.3
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
source_i686=("${pkgname}_${pkgver}_i386.deb::https://s3.amazonaws.com/purevpn-dialer-assets/linux/app/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb::https://s3.amazonaws.com/purevpn-dialer-assets/linux/app/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('cc02e6062c8cd9b44662bc0317b9f1ac49971db3e41970236ab0dc2ec7dbd48065f262c5fea4b07b0ddd5dbd4e7288e23b05f8711d913ed94e6a51959375fc83')
sha512sums_i686=('9c10bae353d8aeba72bfe4d8ef6d3c5c04fbcfb003d8b86cc817a1375df61b52ba342062595e6488829ff41b13636c017f88e03379280ea0e4a25cf9d6b93dbe')
sha512sums_x86_64=('bb064dd172dc3a3405007cba2d9c541a753f375bae34e372200eade26acd52740e1adf34df11e00a6249b142072b26ea523e5ee973c8b1df12866ee3a2f2535d')
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
