# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='nanox'
_bundlepkgname='ompss'
pkgdesc='Nanos++ is a runtime designed to serve as runtime support in parallel environments. It is mainly used to support OmpSs, a extension to OpenMP developed at BSC.'
pkgver='0.15.20190627'
_bundlepkgver='19.06'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://pm.bsc.es/ompss'
license=('GPL2')
depends=(extrae sqlite3)
makedepends=(python)
source=("https://pm.bsc.es/ftp/${_bundlepkgname}/releases/${_bundlepkgname}-${_bundlepkgver}.tar.gz"
        "nanox-Fix-build-due-to-use-of-deprecated-_sys_siglist.patch")
sha512sums=(159efc17ba446f3f2205a8c0580ed10fab263f8bdb7306d5444d1fc6a592f80d749c03031e7e416090360c36a51a38da083b2b2ed4e75dda5c55a103806d91d2
            f900d2c30236ef641e1e527364324e317d1df2746082df0e0bf8adcceb279b7cde6f0c094576e330de24fc9d51f989016f6e2d50489e308fe2f8683acb3bf41c)

prepare() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-${pkgver%.*}"

	patch -Np1 -i "$srcdir/nanox-Fix-build-due-to-use-of-deprecated-_sys_siglist.patch"
}

build() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-${pkgver%.*}"

	# See https://hub.docker.com/r/bscpm/ompss/dockerfile
	./configure \
		--prefix=/usr \
		--with-extrae=/usr

	make
}

package() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install
}
