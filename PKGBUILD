# Submitter: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=radware
_pkgname=rw
pkgver=05.3
_pkgver=05
pkgrel=3
pkgdesc="Software package for interactive graphical analysis of gamma-ray coincidence data"
url="http://radware.phy.ornl.gov/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('openmotif' 'gtk2' 'upak' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi')
makedepends=('gcc-fortran')
install='radware.install'
options=('!emptydirs')
source=("ftp://radware.phy.ornl.gov/pub/radware/unix/${_pkgname}${pkgver}.tgz"
	'Makefile_linux.patch'
	'Makefile_install_ucb.patch'
	'Makefile_common.patch'
	'radware.csh'
	'radware.sh')
md5sums=('d1d57e776d99d062e277041608503f1e'
         'df4e15fd94b19a5e9c651d1f61e19da1'
         '3e327212567c98ee2b9673d87ec935ee'
         '399db4e1a49b3f7051688d71272d02e0'
         'ea98474aada4f5f597c084625fafbe76'
         'b39293fc8f944638a340eb4a5ae4eda8')

build() {
	cd "${srcdir}/${_pkgname}${_pkgver}/src"

	patch -Np3 < ${srcdir}/Makefile_linux.patch
	cp Makefile.linux Makefile

	patch -Np3 < ${srcdir}/Makefile_install_ucb.patch
	patch -Np3 < ${srcdir}/Makefile_common.patch

	make all
}

package() {
	  cd "${srcdir}/${_pkgname}${_pkgver}/src"
	  make DESTINATION_DIR="${pkgdir}/usr" install

	  install -m755 -d ${pkgdir}/etc/profile.d
	  install -m755 ${srcdir}/radware.* ${pkgdir}/etc/profile.d/
	  rm ${pkgdir}/usr/.radware*
}
