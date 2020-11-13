# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-arnold
pkgver=4.0.4.1
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://www.arnoldrenderer.com/arnold/arnold-for-maya/'
license=('custom')
depends=('attr' 'bzip2' 'double-conversion' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite'
		'harfbuzz' 'icu' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'lz4'
		'md4c' 'pcre' 'pcre2' 'qt5-base' 'qt5-x11extras' 'systemd-libs' 'util-linux-libs' 'xz' 'zlib' 'zstd' 'maya>=2020')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://package.zip')
sha256sums=('b4c036093d0de30eb21b88893c5ecf9b6ff798f800cf15544bc9ae63e5f491e0')

options=(!strip)

package() {
	# Install mod File to Maya Directory
	sed -i 's/\/jenkins\/workspace\/Arnold-MTOA_Build_LINUX_CENTOS73\/MTOA_DEPLOY/\/usr\/autodesk\/maya2020\/plug-ins\/arnold/g' mtoa.mod
	install -D -m 644 mtoa.mod $pkgdir/usr/autodesk/maya2020/modules/mtoa.mod

	# Copy Everything else
	rm mtoa.mod readme.txt
	unlink package.zip
	mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins/arnold
	cp -a * $pkgdir/usr/autodesk/maya2020/plug-ins/arnold
}

