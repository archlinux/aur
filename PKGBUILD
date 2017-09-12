# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=amdctl-git
pkgver=unknown
pkgrel=1
pkgdesc="Set P-State voltages and clock speeds on recent AMD CPUs on Linux.
Currently supported families are: 10h, 11h, 12h, 14h, 15h, 16h"
arch=(i686 x86_64)
url="https://github.com/kevinlekiller/amdctl"
license=('GPLv3')
depends=()
source=(https://github.com/kevinlekiller/amdctl/archive/master.zip)
md5sums=(5835a8e17c08f631be67c5fda7c44e0b)

build() 
	{
	cd "${srcdir}"/amdctl-master
	rm amdctl
	make
	}

package() {

	install -Dm755 "${srcdir}"/amdctl-master/amdctl "${pkgdir}"/usr/bin/amdctl
	mkdir "${pkgdir}"/etc/
	mkdir "${pkgdir}"/etc/modules-load.d
	touch "${pkgdir}"/etc/modules-load.d/amdctl.conf
	echo "cpuid" > "${pkgdir}"/etc/modules-load.d/amdctl.conf
	echo "msr" >> "${pkgdir}"/etc/modules-load.d/amdctl.conf
}