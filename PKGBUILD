# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: William Tang <ttan0037@student.monash.edu>
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2020.3
pkgrel=1
pkgdesc='Autodesk Maya 3D Animation, Modelling, Simulation and Rendering Software'
arch=('x86_64')
url="http://www.autodesk.com/products/maya/overview"
license=('custom')
depends=('attr' 'audiofile' 'bzip2' 'curl' 'e2fsprogs' 'expat' 'fontconfig' 'freetype2'
		'gcc-libs' 'glib2' 'glibc' 'glu' 'graphite' 'harfbuzz' 'icu' 'keyutils' 'krb5' 'libglvnd'
		'libice' 'libidn2' 'libjpeg6-turbo' 'libjpeg-turbo' 'libnghttp2' 'libpng' 'libpng15'
		'libpsl' 'libsm' 'libssh2' 'libtiff' 'libunistring' 'libx11' 'libxau' 'libxcb' 'libxdmcp'
		'libxext' 'libxft' 'libxi' 'libxinerama' 'libxml2' 'libxmu' 'libxp' 'libxpm' 'libxrender'
		'libxt' 'openssl' 'pcre' 'tbb' 'util-linux-libs' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi'
		'xz' 'zlib' 'zstd' 'adlmapps>=17' 'adsklicensing=9.2.1.2399')
optdepends=('adlmflexnetclient: Autodesk Stand-alone Licensing Software'
			'adlmflexnetserver-ipv6: Autodesk Network Licensing Software (Deprcate on August 7, 2021)'
			'maya-arnold: Maya Arnold Renderer Plugin'
			'maya-bifrost: Maya Bifrost Effects Plugin'
			'maya-rokoko-motion-library: Maya Rokoko Motion Library Animation Plugin'
			'maya-substance: Maya Substance Material Plugin')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://Maya2020_64-2020.3-1431.x86_64.rpm'
		'maya.desktop')
sha256sums=('4b2de24be40773f8340d61641c353370f750051a9e178294434464573ea3988a'
			'199cf259d54ac756ca034ee43ca45848c65cc16c06a5526fa2a93287faebcb1d')

options=(!strip)

package() {
	mv $srcdir/opt $srcdir/usr $srcdir/var $pkgdir/

	# Fix Symbol Links
	mkdir -p $pkgdir/usr/lib
	ln -sf /usr/lib/libssl.so.1.1 $pkgdir/usr/lib/libssl.so.10
	ln -sf /usr/lib/libcrypto.so.1.1 $pkgdir/usr/lib/libcrypto.so.10
	ln -sf /usr/autodesk/maya2020/lib/libtbb_preview.so.2 $pkgdir/usr/lib/libtbb_preview.so.2

	# Fix tmp Directory
	ln -sf /tmp $pkgdir/usr/tmp

	# Install desktop File
	install -D -m 644 maya.desktop $pkgdir/usr/share/applications/maya.desktop
}

