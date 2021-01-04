# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

#
# After install, launch by running /usr/bin/hpe_ltt
#

pkgname=hpltt
pkgver=4.30
pkgrel=1
pkgdesc="HP Library & Tape Tools - diagnostics for HP tape drives"
arch=('i686' 'x86_64')
#url="https://www.hpe.com/us/en/product-catalog/storage/storage-software/pip.406729.html"
url="https://buy.hpe.com/us/en/storage/storage-software/storage-device-management-software/storeever-tape-device-management-software/hpe-library-tape-tools/p/406729"
license=('custom:HPLTT')
makedepends=('libarchive')
depends=('ncurses5-compat-libs')
options=(!strip)

source_i686=('https://downloads.hpe.com/pub/softlib2/software1/pubsw-generic/p1910951539/v175147/hpe_ltt430_linux_x86.tar')
md5sums_i686=('8f4a6a601a6d9aceb8fde3ab8438fd14')
sha256sums_i686=('4ab1beb325d9db17f43d27ebfbcb82987d8f95fcd3428ce935724a4740057007')

source_x86_64=('https://downloads.hpe.com/pub/softlib2/software1/pubsw-generic/p1910951539/v175147/hpe_ltt430_linux_x86_64.tar')
md5sums_x86_64=('31c96b9f50389d913a3016299622781c')
sha256sums_x86_64=('3053246134e6108d936627a6e9a5c5f4ebd634e0da6c31d8ca2802f26a8a43e4')

package() {
	bsdtar -x -f hpeltt-*.rpm || (error "Multiple .rpm files in source folder, please clean remnants from earlier build (delete $srcdir and use makepkg -c in future)" ; exit 1)
	mv opt "$pkgdir/"
	install -d "$pkgdir/usr/bin"

	# Put a symlink in /usr/bin for ease of launch
	ln -s "/opt/ltt/hpe_ltt" "$pkgdir/usr/bin/hpe_ltt"

	# Don't know why any dirs need to be world-writable when the app runs as root
	# anyway, let's fix
	find "$pkgdir/opt/ltt" -type d -exec chmod 755 {} \;
}
