# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-bifrost
pkgver=2.1.0.0
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=('gcc-libs' 'glibc' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'ncurses5-compat-libs' 'tbb' 'zlib' 'maya>=2020')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost2020-$pkgver-1.x86_64.rpm")
sha256sums=('02d60fc1117b8fdcc9150268858b23f8b8431beed5f43a7cdfe5ece2dfac49fa')

options=(!strip)

package() {
	# Patch & Copy Module Files
	mkdir -p $pkgdir/usr/autodesk/maya2020/modules
	sed -i 's/<BIFROST_DIR>/\/usr\/autodesk\/maya2020\/plug-ins\/bifrost/g' usr/autodesk/modules/maya/2020/bifrost.mod
	sed -i 's/<PLUGIN_DIR>/\/usr\/autodesk\/maya2020\/plug-ins\/vnn/g' usr/autodesk/modules/maya/2020/vnn.mod
	cp -a usr/autodesk/modules/maya/2020/*.mod $pkgdir/usr/autodesk/maya2020/modules/

	# Copy Plugin Files
	mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins
	cp -a usr/autodesk/bifrost/maya2020/$pkgver/bifrost $pkgdir/usr/autodesk/maya2020/plug-ins/
	cp -a usr/autodesk/bifrost/maya2020/$pkgver/vnn $pkgdir/usr/autodesk/maya2020/plug-ins/
}

