# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='nanox'
_bundlepkgname='ompss'
pkgdesc='Nanos++ is a runtime designed to serve as runtime support in parallel environments. It is mainly used to support OmpSs, a extension to OpenMP developed at BSC.'
pkgver='0.14.1'
_bundlepkgver='17.12.1'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://pm.bsc.es/ompss'
license=('GPL2')
depends=(extrae sqlite3)
makedepends=(gcc7)
source=("https://pm.bsc.es/ftp/${_bundlepkgname}/releases/${_bundlepkgname}-${_bundlepkgver}.tar.gz")
sha512sums=(e68effb54b3a4e91da22808a928afcd586d41a3825ec2cea1f783a65d4e075cfb07ce3f5a8006c5a204a46f37fc73383cd549f6706ed12124724b6be18520344)

# WORKAROUND: The sources are outdated according to Arch's standards,
#             so we have to downgrade/disable some things...
export CC=gcc-7
export CXX=g++-7

build() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	# See https://hub.docker.com/r/bscpm/ompss/dockerfile
	./configure \
		--prefix=/usr \
		--with-extrae=/usr

	make
}

package() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
