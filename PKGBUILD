# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.3.0
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
url='https://git.sr.ht/~martijnbraam/megapixels'
license=(LGPL)
arch=(x86_64 aarch64)
depends=(gtk4 zbar)
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('810f1eaaea49d5fb147ed9b1ff7321630fe8b89bf45685b3f09a531007ddaf39')

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
