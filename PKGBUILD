# Maintainer: Jesse McClure <code at jessemcclure dot org>
pkgname=silo-fossil
pkgver=1.0r27.1f26d6d845
pkgrel=1
pkgdesc='Wayland launcher menu'
arch=('x86_64')
license=('MIT')
depends=(cairo glibc libxkbcommon nkk-fossil)
makedepends=(fossil)
optdepends=('wl-clipboard: paste w/ shift+insert')
url=https://code.jessemcclure.org/silo
source=(fossil+https://code.jessemcclure.org/silo)
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/silo"
	printf '%sr%s.%s\n' \
		$(fossil tag list | grep '[0-9\.*]' | sort -r | sed 1q) \
		$(fossil info | sed -n '$s/[a-z:-]* *//p') \
		$(fossil timeline -n 1 -t ci -F %h | sed 1q)
}

build() {
	cd "${srcdir}/silo"
	make
}

package() {
	cd "${srcdir}/silo"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

