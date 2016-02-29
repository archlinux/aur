# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=sterm
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple terminal emulator based on the VTE library"
arch=(x86_64)
url="https://github.com/flocke/${pkgname}"
license=('MIT')
depends=('glib2' 'gtk3' 'pango' 'vte3')
makedepends=('cmake' 'pkg-config')
conflicts=("${pkgname}-git")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flocke/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('676fb06b2b3055d135d5e0e6d03db74d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -DWITH_TESTS=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    .

	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

