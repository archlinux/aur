# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.0.1
pkgrel=1
pkgdesc="GTK3 camera application that knows how to deal with the media request api"
url="https://git.sr.ht/~martijnbraam/megapixels"
license=("LGPL")
arch=(x86_64 aarch64)
depends=(gtk4 zbar)
makedepends=(meson)
checkdepends=()
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4d0dcbce3a80ab800ca79524e814156fe1ceeb8196262c312861f208b9ca802f')

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
