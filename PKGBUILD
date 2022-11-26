# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=sterm-git
pkgver=v0.1.2.r2.g79e77ee
pkgrel=1
pkgdesc="A simple terminal emulator based on the VTE library"
arch=(x86_64)
url="https://github.com/flocke/sterm"
license=('MIT')
depends=('glib2' 'gtk3' 'pango' 'vte3')
makedepends=('git' 'cmake' 'pkg-config')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=("sterm::git+https://github.com/flocke/sterm.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-git}"

  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
    .

	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	make DESTDIR="${pkgdir}/" install
}

