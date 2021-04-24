# Maintainer: nekgem2 <nekgem2@firemail.cc>
# Contributor: Dave Reisner <d@falconindy.com>
pkgname=ngtcp2-notls-git
pkgver=r2652.f183441a
pkgrel=1
pkgdesc="An effort to implement IETF QUIC protocol (main branch, built without tls support)"
arch=('x86_64' 'aarch64')
url="https://github.com/ngtcp2/ngtcp2"
license=('MIT')
makedepends=('git')
checkdepends=('cunit')
provides=('ngtcp2-notls' 'libngtcp2.so')
conflicts=('ngtcp2' 'ngtcp2-notls')
source=('git+https://github.com/ngtcp2/ngtcp2')
md5sums=('SKIP')

pkgver() {
	cd ngtcp2

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ngtcp2

	autoreconf -fisv

	./configure \
		--prefix=/usr \
		--with-openssl=no

	make
}

check() {
	cd ngtcp2

	make -k check
}

package() {
	cd ngtcp2

	make DESTDIR="$pkgdir" install
}
