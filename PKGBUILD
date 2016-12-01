# Maintainer: Darjan Krijan aka DarenK <darjan_krijan@gmx.de>

# Installs Sume binary and library from https://github.com/darenk/sume

pkgname=sume-git
_pkgbasename=sume
pkgver=0.0.1.r12.gd11f51a
pkgrel=1
pkgdesc="Surface metrology command line tool and library."
arch=('i686' 'x86_64')
url="https://github.com/darenk/sume"
license=('GPL')
depends=('pkg-config' 'cpio' 'zlib' 'libarchive' 'xz' 'libxml2' 'mhash')
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
	make DESTDIR="$pkgdir/" install
}
