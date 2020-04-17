# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=amiitool
pkgver=2
pkgrel=2
pkgdesc='Reverse-engineered amiibo cryptography'
url='https://github.com/socram8888/amiitool'
arch=('x86_64')
license=('MIT')
makedepends=('git' 'mbedtls') # git is used to pull head version
source=("$pkgname-r$pkgver.tar.gz::https://github.com/socram8888/amiitool/archive/r$pkgver.tar.gz"
		fix-mbedtls_include.patch) 
md5sums=('a3c193286e4930fa903d742424f5cad5'
         'ec7d604b88be91eea182d9d5da73f413')
_builddir="$pkgname-r$pkgver"

prepare() {
	cd "_$builddir"
	patch -p1 < "${srcdir}/fix-mbedtls_include.patch"
}

build() {
	cd "_$builddir"
	make prefix=/usr
}

package() {
	cd "_$builddir"
	make prefix=/usr DESTDIR="$pkgdir" install
}
