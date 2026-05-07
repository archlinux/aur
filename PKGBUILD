# Maintainer: luozikuan <luozikuan@gmail.com>
# Contributor: aureolebigben <aureolebigben@gmail.com>
# Contributor: Skunnyk <skunnyk@archlinux.fr>
pkgname=cassandra-cpp-driver
_pkgname=cpp-driver
pkgver=2.17.1
pkgrel=3
pkgdesc="DataStax C/C++ Driver for Apache Cassandra"
arch=(i686 x86_64)
url="http://datastax.github.io/cpp-driver/"
license=('Apache')
depends=('libuv' 'openssl' 'zlib')
makedepends=('libuv' 'pkg-config' 'cmake')
source=("https://codeload.github.com/datastax/${_pkgname}/tar.gz/${pkgver}")
sha256sums=('e6ab5f5c60a916dd6c0dd9a19a883a4a1ab3d6b4e95cab925a186fecff08344e')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib -DCMAKE_CXX_FLAGS="-Wno-error" .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
