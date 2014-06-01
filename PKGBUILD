# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Alec Ari <neotheuser@ymail.com>

pkgname=ectool-svn
pkgver=r6637
pkgrel=1
pkgdesc="ectool is a small utility that dumps the RAM of a laptop's Embedded/Environmental Controller (EC)"
url="http://www.coreboot.org/Ectool"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion')
source=('svn://coreboot.org/coreboot/trunk/util/ectool')
md5sums=('SKIP')
conflicts=('ectool')
provices=('ectool')
replaces=('ectool')

pkgver() {
	cd ectool

	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd ectool

	# Makefile is broken #1
	sed -re 's|/sbin|/bin|' -i Makefile
}

build() {
	cd ectool

    make
}

package() {
	cd ectool

	# Makefile is broken #2
	install -d "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}
