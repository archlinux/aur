# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgbase=discreet-bin
pkgname=("discreet-gui-bin" "discreet-daemon-bin")
_pkgname0=${pkgname[0]/-bin/}
_pkgname1=${pkgname[1]/-bin/}
pkgdesc="Discreet Cryptocurrency Wallet. discreet.net"
pkgver=0.3.33
_guiver="${pkgver}-1"
_daemonver=0.2.69-1
pkgrel=3
arch=('x86_64')
#depends=('dotnet-sdk')
url="https://discreet.net"
source=("https://deb.discreet.net/dists/stable/main/binary-amd64/daemon/${_pkgname1}_${_daemonver}_amd64.deb"
"https://deb.discreet.net/dists/stable/main/binary-amd64/wallet-gui/${_pkgname0}_${_guiver}_amd64.deb"
)
sha256sums=('84ea88ffb57c22d1029630e6dbe9d9b82a9d6b176fffe31d6f1c26636d156d22'
            '71efb1c2e3f4dddec095404875d8996d7ce276681e845e8dbff2b1770f4b69bd')
noextract=("${_pkgname0}_${_guiver}_amd64.deb"
"${_pkgname1}_${_daemonver}_amd64.deb")

package_discreet-gui-bin() {
	depends=("discreet-daemon-bin")
	provides=("discreet-gui")
	conflicts=("discreet-gui")
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
	ln -rTsf ${pkgdir}/usr/lib/libdl.so.2 ${pkgdir}/usr/lib/discreet/libdl.so
}
