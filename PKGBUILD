# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=superiotool-svn
epoch=1
pkgver=r6637
pkgrel=1
pkgdesc="Detects the Super I/O of your mainboard and provides information about its register contents"
arch=(i686 x86_64)
url="http://www.coreboot.org/Superiotool"
license=(GPL)
makedepends=(subversion)
source=(svn://coreboot.org/coreboot/trunk/util/superiotool)
md5sums=(SKIP)

pkgver() {
	cd superiotool

	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd superiotool

	# Makefile is broken #1
	sed -re 's|/sbin|/bin|' -i Makefile
}

build() {
	cd superiotool

	make
}

package() {
	cd superiotool

	make PREFIX=/usr DESTDIR="$pkgdir" install
}

