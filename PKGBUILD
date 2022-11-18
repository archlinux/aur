# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgbase=discreet-bin
pkgname=("discreet-gui-bin" "discreet-daemon-bin")
_pkgname0=${pkgname[0]/-bin/}
_pkgname1=${pkgname[1]/-bin/}
pkgdesc="Discreet Cryptocurrency Wallet. discreet.net"
pkgver=0.2.23
_guiver="${pkgver}-3"
_daemonver=0.0.28-2
pkgrel=3
arch=('x86_64')
#depends=('dotnet-sdk')
url="https://discreet.net"
source=("https://deb.discreet.net/pool/main/${_pkgname0}_${_guiver}_amd64.deb"
"https://deb.discreet.net/pool/main/${_pkgname1}_${_daemonver}_amd64.deb"
)
sha256sums=('0c8063f314e8a3a148efe25d44495d8694746375115995682d75e939da13b4d3'
            '438d093d4a692204e85c35966b95ef0d8b5b96c35708630cb4cdbdab1d7f434c')
noextract=("${_pkgname}-gui_${_guiver}_amd64.deb"
"${_pkgname1}_${_daemonver}_amd64.deb")

package_discreet-gui-bin() {
	depends=("discreet-daemon-bin")
	provides=("discreet")
	conflicts=("discreet")
	#create directory trees
	cd ${pkgdir}
	ar -xf ${srcdir}/${_pkgname0}_${_guiver}_amd64.deb
	tar -xf data.tar.xz
	rm data.tar.xz
	rm control.tar.xz
	rm debian-binary
	rm ${pkgdir}/usr/bin/*
	ln -rTsf ${pkgdir}/usr/lib/${_pkgname0}/Discreet-GUI ${pkgdir}/usr/bin/${_pkgname0}
}
package_discreet-daemon-bin() {
	depends=("bzip2" "snappy" "lz4" "zlib" "zstd" "glibc")
	provides=("discreet-daemon")
	conflicts=("discreet-daemon")
	#create directory trees
	cd ${pkgdir}
	ar -xf ${srcdir}/${_pkgname1}_${_daemonver}_amd64.deb
	tar -xf data.tar.xz
	rm data.tar.xz
	rm control.tar.xz
	rm debian-binary
	rm ${pkgdir}/usr/bin/*
	ln -rTsf ${pkgdir}/usr/lib/discreet/Discreet ${pkgdir}/usr/bin/discreetd
}
