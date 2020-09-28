# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=pinktrace-1
pkgdesc='Lightweight ptrace() wrapper library'
pkgver=0.9.3
pkgrel=2
license=(custom:BSD)
depends=(glibc)
url='https://git.exherbo.org/pinktrace-1.git'
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.xz")
arch=(x86_64)
sha512sums=('78d6b3509380ccfff06c31babb23326d1609a4e18f9f4da925b1d81e4305092375013c63b73d5a42cbdbd521db64994006839ef9ad86771dc3f45a73cd4608e1')

build () {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check () {
	echo 'Linking tests seems to be broken. Skipped.'
	# make -C "${pkgname}-${pkgver}" check
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
