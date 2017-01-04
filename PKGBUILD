# Maintainer: Darjan Krijan aka DarenK <darjan_krijan@gmx.de>

# Installs Sume binary and library from https://github.com/darenk/sume

pkgname=sume-git
_pkgbasename=sume
pkgver=0.1.0.r18.gd4a00a5
pkgrel=1
pkgdesc="Surface metrology command line tool and library."
arch=('i686' 'x86_64')
url="https://github.com/darenk/sume"
license=('GPL')
depends=('pkg-config' 'cpio' 'libpng' 'zlib' 'libarchive' 'xz' 'libxml2' 'mhash')
provides=($_pkgname)
conflicts=(${_pkgbasename})

source=("${pkgname}::git+https://github.com/darenk/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/${pkgname}

	export CFLAGS="-mtune=generic"
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}
	sed -i 's@=/usr@='"${pkgdir}"'\/usr@g' build/make_cfg
	make install
}
