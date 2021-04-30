# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=0.16.0
pkgrel=1
pkgdesc="GTK3 camera application that knows how to deal with the media request api"
url="https://git.sr.ht/~martijnbraam/megapixels"
license=("LGPL")
arch=(x86_64 aarch64)
depends=(gtk3 zbar)
makedepends=(meson)
checkdepends=()
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('70430a7b4fee4e6edcc3a9da70f630d9943d474e64b2ce3f4f5eb6a5452f2ca5')

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
