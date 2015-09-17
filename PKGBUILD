# Maintainer: Matthew Gamble
# Contributor : Draje <draje@nullsum.net>

pkgname=mp3fs-git
pkgver=20150913
pkgrel=1
pkgdesc="A read-only FUSE filesystem which transcodes audio formats (currently FLAC) to MP3 on the fly when opened and read."
arch=('i686' 'x86_64')
url="http://khenriks.github.com/mp3fs/"
license=('GPL')
depends=('fuse' 'flac' 'lame' 'libid3tag')
makedepends=('git' 'asciidoc')
conflicts=('mp3fs')
source=('git://github.com/khenriks/mp3fs.git')
sha256sums=('SKIP')

build() {
	cd "$srcdir/mp3fs"

	./autogen.sh
	./configure --prefix=/usr \
		--without-vorbis-picture # There is no package for libb64 in Arch Linux as of today
	make || return 1
}

package() {
	cd "$srcdir/mp3fs"
	make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}
