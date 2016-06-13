# Contributor: Alabin Artem <kirpicheff@yandex.ru>
# Contributor: K0n24d <konrad AT knauber DOT net>
pkgname=urbackup-client
pkgver=1.4.11
pkgrel=2
pkgdesc="Client Server backup system"
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="http://www.urbackup.org/"
license=("GPL")
makedepends=('gcc-libs' 'gcc' 'make')
depends=('wxgtk' 'crypto++')
conflicts=('urbackup-client-no-gui')
source=("https://hndl.urbackup.org/Client/${pkgver}/urbackup-client-${pkgver}.tar.gz"
        'urbackup-client.service')

md5sums=('a7d3e5a235b9897b1102b7709dd4e0d0'
         '1eb3db6d0e3bf40976bf7058290c62e1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CXXFLAGS=-ansi ./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var 
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=$pkgdir install
	install -Dm755 "${srcdir}"/urbackup-client.service \
		"${pkgdir}"/usr/lib/systemd/system/urbackup-client.service
        install -D "${srcdir}/urbackup-client-${pkgver}"/docs/start_urbackup_client.1 \
                "${pkgdir}"/usr/share/man/man1/start_urbackup_client.1
        install -D "${srcdir}/urbackup-client-${pkgver}"/docs/urbackup_client.1 \
                "${pkgdir}"/usr/share/man/man1/urbackup_client.1
}
# vim: ts=2
