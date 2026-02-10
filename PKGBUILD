# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Maintainer: Tim van Leuverden <TvanLeuverden at Gmail dot com>

#
# After install, launch by running /usr/bin/hpe_ltt
#

pkgname=hpltt
pkgver=6.6
pkgrel=1
pkgdesc="HP Library & Tape Tools - diagnostics for HP tape drives"
arch=('x86_64')
url="https://buy.hpe.com/us/en/storage/storage-software/storage-device-management-software/storeever-tape-device-management-software/hpe-library-tape-tools/p/406729"
license=('custom:HPLTT')
makedepends=('libarchive')
depends=('ncurses5-compat-libs')
options=(!strip)
validpgpkeys=('57446EFDE098E5C934B69C7DC208ADDE26C2B797')

source_x86_64=('https://downloads.hpe.com/pub/softlib2/software1/pubsw-generic/p1910951539/v269121/hpe_ltt66_linux_x86_64.tar'{,.sig})
sha256sums_x86_64=('8588da0a69889fed427129bad8906f80c6e878473086ed35b9e83bf3e7bd4bb2'
                   '709df142b5343ce7f1b89b314af30da450c131428dd97a6be0214d04cd388644')

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
