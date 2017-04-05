# In order to get the DeviceAtlas enterprise C api and a limited JSON data file,
# you need to visit https://deviceatlas.com/deviceatlas-haproxy-module
# and register to get a license key. If you want to upgrade your license,
# please visit this page https://deviceatlas.com/contact-us

# Maintainer: David Carlier <devnexen@gmail.com>
pkgname=deviceatlas-enterprise-c
pkgver=2.1.2_1
pkgrel=1
pkgdesc="DeviceAtlas enterprise C API"
arch=('i686' 'x86_64')
url="https://deviceatlas.com/deviceatlas-haproxy-module"
license=('unknown')
depends=('pcre')
makedepends=('cmake')
source=("$pkgname-$pkgver.tgz::file://$pkgname-$pkgver.tgz" "$pkgname-src-cmakelists.patch")
md5sums=('ac23e436ff408ef9a4377c68e2609173' 'f888cc250a58aa1e26bc4d1e2ecda838')

prepare() {
	cd $pkgname-$pkgver
	patch -p0 -i ../$pkgname-src-cmakelists.patch
}

build() {
	cd $pkgname-$pkgver
	cmake .
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
