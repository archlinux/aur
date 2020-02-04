# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'AMDuProf_Linux_x64_${pkgver}.tar.bz2' required from upstream

pkgname=amduprof
pkgver=3.2.228
pkgrel=3
pkgdesc="AMD uProf performance analysis tool."
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-uprof/"
source=("local://AMDuProf_Linux_x64_${pkgver}.tar.bz2"
		"local://modulefile")
options=('staticlibs' '!strip' 'libtool')
depends=('env-modules')
install=amduprof.install
md5sums=("5b7927f1b583fc56f9d021d8116496af"
		"SKIP")

if [ -z ${MODULESHOME} ]; then
	echo "Environment variable MODULESHOME from env-modules is unset."
	echo "Restart your shell or source the env-modules scripts for your shell."
	exit 1
fi

amduprof_prefix=/opt/${pkgname}

package() {
	prefix=${pkgdir}/${amduprof_prefix}
	mkdir -p ${prefix}
	cp -r ${srcdir}/AMDuProf_Linux_x64_${pkgver}/* ${prefix}

	# modulefile
	echo -e "\nSymlinking modulefile '${modulefile}'..."
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${amduprof_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}
