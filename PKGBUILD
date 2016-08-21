# Maintainer: piernov <piernov@piernov.org>

pkgname=adobe-flashplugin
pkgdesc="Adobe Pepper Flash plugin"
pkgver=22.0.0.209
pkgrel=1
_rel=20160712.1
arch=('x86_64' 'i686')
url="https://launchpad.net/ubuntu/+source/adobe-flashplugin"
license=('custom')
depends=('gcc-libs')
optdepends=('freshplayerplugin: Firefox support')
conflicts=('chromium-pepper-flash' 'flashplugin')
provides=('pepper-flash')
source=("https://launchpad.net/ubuntu/+archive/partner/+files/adobe-flashplugin_${_rel}.orig.tar.gz")
sha256sums=('164329378ebc112bbaf684643dad1d8ba77dd6f18170cba90770accc66cc7478')

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
