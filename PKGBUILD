# Maintainer: nathan marchiori <nathan.marchiori@gmail.com>
pkgname="drawy-git"
pkgver=r464.c2ab5a6
pkgrel=4
pkgdesc="an infinite whiteboard tool"
arch=("x86_64")
url="https://invent.kde.org/graphics/drawy"
license=('GPL-3.0-only')
depends=('qt6-base>=6.9' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'zstd' 'kcoreaddons' 'kcrash' 'kwidgetsaddons' 'kconfig')
makedepends=('git' 'cmake' 'qt6-tools' 'gcc' 'vulkan-headers' 'extra-cmake-modules')
provides=('drawy' 'drawy-debug')
source=('drawy-git::git+https://invent.kde.org/graphics/drawy')
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON
	cmake --build build --config Release
}

package() {
	cd "$pkgname"
	cmake --install build --prefix "$pkgdir/usr"
}
