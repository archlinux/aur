# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

#
# After install, launch by running /usr/bin/hpe_ltt
#

pkgname=hpltt
pkgver=4.27
pkgrel=1
pkgdesc="HP Library & Tape Tools - diagnostics for HP tape drives"
arch=('i686' 'x86_64')
url="https://www.hpe.com/us/en/product-catalog/storage/storage-software/pip.406729.html"
license=('custom:HPLTT')
makedepends=('libarchive')
depends=('ncurses5-compat-libs')
options=(!strip)

source_i686=('https://downloads.hpe.com/pub/softlib2/software1/pubsw-generic/p1910951539/v157632/hpe_ltt427_linux_x86.tar')
md5sums_i686=('55af0106931e1103a3465620a2c4070c')
sha256sums_i686=('4b44f54476878de411809f933eefd746de7b6ec035a28e46049ea1903c6adc91')

source_x86_64=('https://downloads.hpe.com/pub/softlib2/software1/pubsw-generic/p1910951539/v157632/hpe_ltt427_linux_x86_64.tar')
md5sums_x86_64=('210b04e444dc821744e7ffa431bd119b')
sha256sums_x86_64=('d5cf5745759fea7dacaed725758f16a02c5b766b6648c93b6811942a720758d5')

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
