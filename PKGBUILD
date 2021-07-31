# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.2.0
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
url='https://git.sr.ht/~martijnbraam/megapixels'
license=(LGPL)
arch=(x86_64 aarch64)
depends=(gtk4 zbar)
makedepends=(meson)
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('aab3bb02b37c3f1c69143419ed79ed3a45ecf5f93d8547e49fa7306389b6d502')

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
