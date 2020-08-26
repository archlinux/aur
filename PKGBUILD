# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dmon-git
pkgver=0.4.5+40
pkgrel=1
pkgdesc='Toolset for daemonizing and supervising processes (Git build)'
arch=(i686 x86_64 arm)
url=https://git.sr.ht/~aperezdc/dmon
license=(custom:MIT)
depends=(glibc)
makedepends=(make gnupg git)
conflicts=(dmon)
provides=(dmon)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver() {
	cd "${pkgname}"
	local v=$(git describe --tags --long)
	v=${v#v}
	v=${v/-/+}
	echo "${v%-*}"
}

build() {
	cd "${pkgname}"
	make MULTICALL=1 PREFIX=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
	cd "${pkgname}"
	make MULTICALL=1 PREFIX=/usr DESTDIR="${pkgdir}/" install
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
