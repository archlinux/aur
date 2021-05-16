# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=ngtcp2-git
pkgver=r2657.d9524643
pkgrel=1
pkgdesc="An effort to implement IETF QUIC protocol"
arch=('x86_64')
url="https://github.com/ngtcp2/ngtcp2"
license=('MIT')
depends=('gnutls')
makedepends=('git')
checkdepends=('cunit')
provides=('ngtcp2' 'libngtcp2.so')
conflicts=('ngtcp2')
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
      --prefix=/usr --with-gnutls

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
