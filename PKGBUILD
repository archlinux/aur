# Maintainer: Darjan Krijan (DarenK) <darjan_krijan@gmx.de>

# Installs Sume binary and library from https://github.com/darenk/sume

pkgname=sume-git
_pkgbasename=sume
pkgver=0.1.0.r106.g3bc7182
pkgrel=1
pkgdesc="Surface metrology command line tool and library."
arch=('any')
url="https://github.com/darenk/sume"
license=('GPL3')
depends=('pkg-config' 'cpio' 'imagemagick' 'libpng' 'zlib' 'libarchive' 'xz' 'libxml2')
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

	export CFLAGS="-march=native"
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}

	make DESTDIR=${pkgdir} install
}
