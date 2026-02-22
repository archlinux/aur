pkgname=systemdgenie-git
pkgver=0.99.0.r410.g153ece4
pkgrel=1
url=https://invent.kde.org/system/systemdgenie
pkgdesc='Systemd managment utility'
arch=(any)
license=(GPL-2.0-or-later)
depends=(qt6-base qt6-declarative kauth kcoreaddons kcrash ki18n ktexteditor kio)
makedepends=(git cmake extra-cmake-modules vulkan-headers)
provides=(systemdgenie)
conflicts=(systemdgenie)
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
	cd systemdgenie
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../systemdgenie \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DBUILD_TESTING=OFF
	make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
