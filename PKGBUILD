# Maintainer: piernov <piernov@piernov.org>

pkgname=adobe-flashplugin
pkgdesc="Adobe Pepper Flash plugin"
pkgver=22.0.0.192
pkgrel=1
_rel=20160616.1
arch=('x86_64' 'i686')
url="https://launchpad.net/ubuntu/+source/adobe-flashplugin"
license=('custom')
depends=('gcc-libs')
optdepends=('freshplayerplugin: Firefox support')
conflicts=('chromium-pepper-flash' 'flashplugin')
provides=('pepper-flash')
source=("https://launchpad.net/ubuntu/+archive/partner/+files/adobe-flashplugin_${_rel}.orig.tar.gz")
sha256sums=('56fca7a80832295a1f542bda27c79bfc1bfc6106cc36e05684e6b86b38dbcd16')

package() {
	# create required directories
	install -d "${pkgdir}"/usr/lib/PepperFlash

	# copy required files
	if [ "$CARCH" = x86_64 ]; then
		_arch=amd64
	else
		_arch=i386
	fi

	install -m644 "${srcdir}"/adobe-flashplugin-${_rel}/${_arch}/{manifest.json,libpepflashplayer.so} "${pkgdir}"/usr/lib/PepperFlash

	cp -dr --preserve=mode,timestamp "${srcdir}"/adobe-flashplugin-${_rel}/${_arch}/usr/* "${pkgdir}"/usr

	if [ "$CARCH" = x86_64 ]; then
		rm -rf "${pkgdir}"/usr/lib/kde4
		mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib
		rm -r "${pkgdir}"/usr/lib64
	fi
}
