# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

#
# After install, launch by running /usr/bin/hpe_ltt
#

pkgname=hpltt
pkgver=4.22
pkgrel=3
pkgdesc="HP Library & Tape Tools - diagnostics for HP tape drives"
arch=('i686' 'x86_64')
url="https://www.hpe.com/us/en/product-catalog/storage/storage-software/pip.406729.html"
license=('custom:HPLTT')
makedepends=('libarchive')
depends=('ncurses5-compat-libs')
options=(!strip)

source_i686=('ftp://ftp.hp.com/pub/softlib/software13/COL21415/co-170909-1/hpe_ltt422_linux_x86.tar')
md5sums_i686=('d1a03385f9ee94c9b6f36a37dae7cadb')
sha256sums_i686=('b72727911bc146e2951a2793607ae2a859045690b38d11de0457af0bbbce587f')

source_x86_64=('ftp://ftp.hp.com/pub/softlib/software13/COL21415/co-170907-1/hpe_ltt422_linux_x86_64.tar')
md5sums_x86_64=('92e82d741b893b24a84eb40c2c2922a1')
sha256sums_x86_64=('486390e230a0d04d0514975c3da24cae6404882e021f589f68a22709c61c72f9')

package() {
	bsdtar -x -f ltt-*.rpm || (error "Multiple .rpm files in source folder, please clean remnants from earlier build (delete $srcdir and use makepkg -c in future)" ; exit 1)
	mv opt "$pkgdir/"
	install -d "$pkgdir/usr/bin"

	# Put a symlink in /usr/bin for ease of launch
	ln -s "/opt/ltt/hpe_ltt" "$pkgdir/usr/bin/hpe_ltt"

	# Don't know why any dirs need to be world-writable when the app runs as root
	# anyway, let's fix
	find "$pkgdir/opt/ltt" -type d -exec chmod 755 {} \;
}
