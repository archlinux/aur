# Maintainer: Jesse McClure <code at jessemcclure dot org>
_fossil=nkk
pkgname=${_fossil}-fossil
pkgver=r5.c8b52ae0ba
pkgrel=1
pkgdesc='Wayland client library w/ cairo drawing'
arch=('x86_64')
license=('MIT')
depends=(cairo glib2 glibc libglvnd libxkbcommon pango wayland)
makedepends=(fossil)
provides=(nkk)
url=https://code.jessemcclure.org/${_fossil}
source=(fossil+${url})
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_fossil}"
	printf '%sr%s.%s\n' \
		"$(fossil tag list | grep '[0-9\.*]' | sort -r | sed 1q)" \
		"$(fossil info | sed -n '$s/[a-z:-]* *//p')" \
		"$(fossil timeline -n 1 -t ci -F %h | sed 1q)"
}

build() {
	cd "${srcdir}/${_fossil}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${_fossil}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

