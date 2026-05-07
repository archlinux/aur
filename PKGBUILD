# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=esh-shell
pkgdesc='Unix shell with LISP-like syntax created originally by Ivan Tkatchev'
pkgver=0.8.6
pkgrel=1
url=https://codeberg.org/aperezdc/esh
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(readline)
makedepends=(meson texinfo)
source=("$url/releases/download/v$pkgver/esh-$pkgver.tar.xz"{,.asc})
sha256sums=('35fe69def141aa73840fd3be9cd1c171ce5a6ed51dde83acd6a2ff7c2cea04e1'
            'SKIP')
validpgpkeys=(
	'5AA3BC334FD7E3369E7C77B291C559DBE4C9123B' # Adrián Pérez de Castro <aperez@igalia.com>
)


build () {
	rm -rf _build
	arch-meson \
		-Ddocumentation=true \
		-Dreadline=enabled \
		_build "esh-$pkgver"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="$pkgdir"
	install -Dm644 _build/doc/esh.info "$pkgdir/usr/share/info/esh.info"
}
