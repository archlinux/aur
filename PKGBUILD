_name=kwayland
pkgname=${_name}5-git
pkgver=5.116.0.r3.g6d2bd22
pkgrel=1
pkgdesc='Qt-style Client and Server library wrapper for the Wayland libraries'
arch=(x86_64)
url='https://www.kde.org'
license=(LGPL)
depends=(qt5-wayland)
makedepends=(extra-cmake-modules-git doxygen git qt5-tools qt5-doc wayland-protocols-git plasma-wayland-protocols-git)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
source=("git+https://invent.kde.org/plasma/kwayland#branch=kf5"
	"https://invent.kde.org/plasma/kwayland/-/commit/0954a179.patch")
md5sums=("SKIP"
	"SKIP")

pkgver() {
	cd "${_name}"
	git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $_name \
		-DCMAKE_INSTALL_LIBEXECDIR=lib \
		-DBUILD_TESTING=OFF \
		-DBUILD_QCH=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
