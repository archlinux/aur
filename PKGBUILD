# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sydbox-1
pkgdesc='ptrace()-based sandbox utility'
pkgver=1.0.8
pkgrel=2
arch=(x86_64)
url=https://git.exherbo.org/sydbox-1.git/
license=(custom:BSD)
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.xz")
depends=(bash 'pinktrace-1>=0.9' 'pinktrace-1<1.0' python)
sha512sums=('80d7614569519d226eabeeb63c688d96a7899b36dc8f8c009d4532c910b7e2a7da0322e375051264b902ec9f2b62a066451ae57d35385c7ac69bc718815ff433')

build () {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	LDFLAGS="${LDFLAGS} /usr/lib/libpinktrace_0.9.so" ./configure \
		--prefix=/usr --libexecdir=/usr/lib
	make
}

check () {
	make -C "${pkgname}-${pkgver}" check
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYRIGHT
}
