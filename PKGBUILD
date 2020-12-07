# Maintainer: Sergey Starovoytov <sergey.starovoytov.94@gmail.com>

pkgname=breath-gtk-git
_pkgname=breath-gtk
pkgver=r3.da27066
pkgrel=1
pkgdesc="Breath widget style for GTK applications"
provides=('breath-gtk-theme')
conflicts=('breath-gtk-theme')
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/$_pkgname"
license=('LGPL')
makedepends=('extra-cmake-modules')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../$_pkgname \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON
make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
