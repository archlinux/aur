# Maintainer: Jesse McClure <code at jessemcclure dot org>
_fossil=tabby
pkgname=${_fossil}-fossil
pkgver=2.0r129.8b61ce82dc
pkgrel=1
pkgdesc='Tabbed tiling wayland compositor'
arch=('x86_64')
license=('MIT')
depends=(cairo glib2 glibc libxkbcommon nkk pango wayland wlroots)
makedepends=(fossil wayland-protocols)
optdepends=('polkit: starting wlroots-based compositors without seatd')
url=https://code.jessemcclure.org/${_fossil}
source=(fossil+${url})
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_fossil}"
	printf '%sr%s.%s\n' \
		$(fossil tag list | grep '[0-9\.*]' | sort -r | sed 1q) \
		$(fossil info | sed -n '$s/[a-z:-]* *//p') \
		$(fossil timeline -n 1 -t ci -F %h | sed 1q)
}

build() {
	cd "${srcdir}/${_fossil}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${_fossil}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

