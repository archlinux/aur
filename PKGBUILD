# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=amdctl-git
pkgver=0.3
pkgrel=1
pkgdesc="Set P-State voltages and clock speeds on recent AMD CPUs on Linux.
Currently supported families are: 10h, 11h, 12h, 14h, 15h, 16h"
arch=(i686 x86_64)
url="https://github.com/kevinlekiller/amdctl"
license=('GPLv3')
depends=()
source=(https://github.com/kevinlekiller/amdctl/archive/v"${pkgver}".zip)
md5sums=(f152b897230bebf4c31ae9c2aae2e61c)

build()
	{
	cd "${srcdir}"/amdctl-${pkgver}
	make
	}

package() {

	install -Dm755 "${srcdir}"/amdctl-${pkgver}/amdctl "${pkgdir}"/usr/bin/amdctl
	mkdir "${pkgdir}"/etc/
	mkdir "${pkgdir}"/etc/modules-load.d
	touch "${pkgdir}"/etc/modules-load.d/amdctl.conf
	echo "cpuid" > "${pkgdir}"/etc/modules-load.d/amdctl.conf
	echo "msr" >> "${pkgdir}"/etc/modules-load.d/amdctl.conf
}
