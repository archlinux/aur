# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=tpc-git
pkgver=0.44rc2plus
pkgrel=2
pkgdesc="For AMD processors. It can manipulate power states, frequencies, DRAM timings, power settings and can report temperatures, monitor pstate changes and precise cpu usage.
Currently supported families are: 10h, 11h, 12h, 14h, 15h"
arch=(i686 x86_64)
url="https://github.com/turionpowercontrol/tpc"
license=('GPLv2')
depends=('gcc-libs' 'ncurses')
source=(https://github.com/turionpowercontrol/tpc/archive/master.zip https://gist.githubusercontent.com/YamashitaRen/43482f1eed4a505f7076593e5d9dfa1e/raw/876f8faadb04919e8984754daed495da1ab2033f/buildnewgcc.patch)
md5sums=(765101c002be892d64caa23b905b07de 87f0ec45561f9e2cb4de2ba46672b307)

build() {

	cd "${srcdir}"/tpc-master
	patch -p1 < ../buildnewgcc.patch
	make

}

package() {

	install -Dm755 "${srcdir}"/tpc-master/TurionPowerControl "${pkgdir}"/usr/bin/tpc
	mkdir "${pkgdir}"/etc/
	mkdir "${pkgdir}"/etc/modules-load.d
	touch "${pkgdir}"/etc/modules-load.d/tpc.conf
	echo "cpuid" > "${pkgdir}"/etc/modules-load.d/tpc.conf
	echo "msr" >> "${pkgdir}"/etc/modules-load.d/tpc.conf
}
