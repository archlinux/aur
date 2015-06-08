# Contributor: Alabin Artem <kirpicheff@yandex.ru>
# Contributor: K0n24d <konrad AT knauber DOT net>
pkgname=urbackup-client-no-gui
pkgver=1.4.8
pkgrel=3
pkgdesc="Client Server backup system"
arch=("i686" "x86_64")
url="http://www.urbackup.org/"
license=("GPL")
makedepends=('gcc-libs' 'gcc' 'make')
depends=('crypto++')
conflicts=('urbackup-client')
source=("http://sourceforge.net/projects/urbackup/files/Client/${pkgver}/urbackup-client-${pkgver}.tar.gz/download"
        'urbackup-client.service')

md5sums=('e711c8b4a4776d58a9753d82b8371d83'
         '1eb3db6d0e3bf40976bf7058290c62e1')

build() {
	cd "${srcdir}/urbackup-client-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --enable-headless
	make
}

package() {
	cd "${srcdir}/urbackup-client-${pkgver}"
	make DESTDIR=$pkgdir install
	install -Dm755 "${srcdir}"/urbackup-client.service \
		"${pkgdir}"/usr/lib/systemd/system/urbackup-client.service
        install -D "${srcdir}/urbackup-client-${pkgver}"/docs/start_urbackup_client.1 \
                "${pkgdir}"/usr/share/man/man1/start_urbackup_client.1
        install -D "${srcdir}/urbackup-client-${pkgver}"/docs/urbackup_client.1 \
                "${pkgdir}"/usr/share/man/man1/urbackup_client.1
}
# vim: ts=2
