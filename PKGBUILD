# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=oxygen-gtk3
pkgver=1.4.1
pkgrel=1
pkgdesc="Port of the Oxygen widget theme to GTK"
arch=('x86_64')
url="https://invent.kde.org/plasma/oxygen-gtk"
license=('LGPL-2.0-or-later')
depends=('libgcc' 'libx11' 'gdk-pixbuf2' 'glibc' 'libstdc++' 'cairo' 'glib2' 'gtk3' 'pango')
makedepends=('cmake')
source=("${pkgname::-1}-vgtk3-${pkgver}.tar.gz::$url/-/archive/vgtk3-${pkgver}/${pkgname::-1}-vgtk3-${pkgver}.tar.gz?ref_type=tags")
sha256sums=('3e261b92563e13f09420da5ab7fc0270d50cf50f8a7c1f0162f361e10162a43c')

prepare() {
	cd "$srcdir"
}

build() {
	cd "$srcdir"
	cmake -B build -S "${pkgname::-1}-vgtk3-${pkgver}" \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_C_FLAGS="${CFLAGS} -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
}
