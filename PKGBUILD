# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.1.0
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
url='https://git.sr.ht/~martijnbraam/megapixels'
license=(LGPL)
arch=(x86_64 aarch64)
depends=(gtk4 zbar)
makedepends=(meson)
source=(
	"${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz"
	'file://0000-patch-build-gschemas.patch'
)
sha256sums=(
	'1434d03663d2a5c5214ae9bb121a89299e582ea0410c8897805ea136345bfaf1'
	'1357a3218c7aa739eb2a1583fec09065cc0783cde59edff77aa4d3f57ba2f24b'
)

prepare() {
	patch ${pkgname}-${pkgver}/data/meson.build -i 0000-patch-build-gschemas.patch
}

build() {
	arch-meson ${pkgname}-${pkgver} build -D gtk_doc=true
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
