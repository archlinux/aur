# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=naconnect
pkgdesc='ncurses-based ALSA MIDI sequencer connection manager'
pkgver=85
pkgrel=3
url=http://web.archive.org/web/20160402080632/http://nedko.arnaudov.name/soft/naconnect/
arch=(x86_64)
license=(GPL2)
depends=(alsa-lib ncurses)
source=("${url}/${pkgname}-r${pkgver}.tar.bz2"
        'http://www.mcs.anl.gov/~kazutomo/list/list.h')
sha512sums=('90bb5e4861668d4accbf51f8c06690d29498f8cc206cd82e008def185807d1ea53f84ff5370bd88ae2162976c198b27f30abecf036bbdc3286ecc694fbbe6c3a'
            '73412859e7daf786a53d446b0caec219783bede42a30a6e0f33b225b0281efdf7b07cd38a538579faa316e927d59e6ec5d140875813eeb60a132c41ad6a88cad')

prepare () {
	# Overwrite the old Linux kernel list.h included in the package with
	# a version known to work properly.
	cp "${srcdir}/list.h" "${pkgname}-r${pkgver}/list.h"
}

build () {
	cd "${pkgname}-r${pkgver}"

	# Run compiler manually, the Makefile forces its own CFLAGS (sigh!)
	gcc ${CFLAGS} ${LDFLAGS} -Wall -Wno-error=format-security -o naconnect naconnect.c -lncurses -lasound
}

package () {
	cd "${pkgname}-r${pkgver}"
	install -Dm755 naconnect "${pkgdir}/usr/bin/naconnect"
}
