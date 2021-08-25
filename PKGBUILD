# Maintainer: Jesse McClure <code at jessemcclure dot org>
pkgname=ynot-fossil
pkgver=1.0r17.904ac4de19
pkgrel=1
pkgdesc='Scriptable calendar for the cli and web'
arch=('x86_64')
license=('MIT')
depends=(glibc)
makedepends=(fossil)
url=https://code.jessemcclure.org/ynot
source=(fossil+https://code.jessemcclure.org/ynot)
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/ynot"
	printf '%sr%s.%s\n' \
		$(fossil tag list | grep '[0-9\.*]' | sort -r | sed 1q) \
		$(fossil info | sed -n '$s/[a-z:-]* *//p') \
		$(fossil timeline -n 1 -t ci -F %h | sed 1q)
}

build() {
	cd "${srcdir}/ynot"
	make
}

package() {
	cd "${srcdir}/ynot"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

