# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-substance
pkgver=2.1.2
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.substance3d.com/ecosystem-plug-ins/substance-in-maya'
license=('custom')
depends=('gcc-libs' 'glibc' 'glu' 'libglvnd' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'maya>=2020')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://SubstanceInMaya-$pkgver-2020-Linux.rpm")
sha256sums=('1307b537ac565e3ffe82e5a0bdad6c042ab169353f92d6aca00a637dab437bf8')

options=(!strip)

package() {
	# Patch & Install mod File
	cat <<- EOF > opt/Allegorithmic/Substance_in_Maya/2020/substance2.mod
		+ PLATFORM:linux substance2 $pkgver /usr/autodesk/maya2020/plug-ins/substance2
		PATH+:=lib
	EOF
	mkdir -p $pkgdir/usr/autodesk/maya2020/modules
	mv opt/Allegorithmic/Substance_in_Maya/2020/substance2.mod \
		$pkgdir/usr/autodesk/maya2020/modules/substance2.mod

	# Copy Plugin Files
	mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins/substance2
	cp -a opt/Allegorithmic/Substance_in_Maya/2020/* $pkgdir/usr/autodesk/maya2020/plug-ins/substance2/
}

