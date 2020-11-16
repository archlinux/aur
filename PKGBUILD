# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adsklicensing
pkgver=9.2.1.2399
pkgrel=1
pkgdesc='Autodesk Licensing Checking Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'libglvnd' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'pcre')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://adsklicensing9.2.1.2399-0-0.x86_64.rpm'
		'adsklicensing.install'
		'adsklicensing.service')
sha256sums=('d9404416708ce2ad5c1f88dbd2bb26fa799440a6b15217be7f85028b0d23c476'
			'da398f067c4ffe98e31b96b804f64fae31c442a0f86f56e76c8b460255207fb9'
			'e5612c0dd6297dd959d93369e899fa3fc85a08a2e42358c81b970a3a7d85ce7d')

options=(!strip)
install='adsklicensing.install'

package() {
	cp -a $srcdir/opt $pkgdir/

	# Remove Service Files
	rm $pkgdir/opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/adsklicensing*

	# Install Custom Service File
	install -D -m 644 adsklicensing.service $pkgdir/usr/lib/systemd/system/adsklicensing.service
}

