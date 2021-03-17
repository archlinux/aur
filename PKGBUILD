# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'AMDuProf_Linux_x64_${pkgver}.tar.bz2' required from upstream

pkgname=amduprof
pkgver=3.4.468
pkgrel=1
pkgdesc="AMD uProf performance analysis tool."
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-uprof/"
source=("local://AMDuProf_Linux_x64_${pkgver}.tar.bz2"
		"local://modulefile")
options=('staticlibs' '!strip' 'libtool')
optdepends=('env-modules')
install=amduprof.install
md5sums=("d3463cce390acbd9174dea8b2ae2b8c1" "SKIP")


amduprof_prefix=/opt/${pkgname}

package() {
	prefix=${pkgdir}/${amduprof_prefix}
	mkdir -p ${prefix}
	cp -r ${srcdir}/AMDuProf_Linux_x64_${pkgver}/* ${prefix}

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}/etc/modules/modulefiles/
	ln -s ${amduprof_prefix}/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}
