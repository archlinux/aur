# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=superiotool-git
epoch=1
pkgver=4.11.r2679.g1afe2863678
pkgrel=1
pkgdesc="Detects the Super I/O of your mainboard and provides information about its register contents"
arch=(i686 x86_64)
url="http://www.coreboot.org/Superiotool"
license=(GPL)
makedepends=('git')
provides=('superiotool')
replaces=('superiotool-svn')
source=('git+https://review.coreboot.org/coreboot')
md5sums=(SKIP)

pkgver() {
	cd coreboot/util/superiotool

	git describe --long $(git rev-list -1 HEAD .) | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd coreboot/util/superiotool

	# Makefile is broken #1
	sed -re 's|/sbin|/bin|' -i Makefile
}

build() {
	cd coreboot/util/superiotool

	make
}

package() {
	cd coreboot/util/superiotool

	make PREFIX=/usr DESTDIR="$pkgdir" install
}

