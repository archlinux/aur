# Maintainer: Mixaz <mixazplus at gmail dot com>
pkgname=xenoprobes-git
pkgver=r33.f10a775
pkgrel=1
pkgdesc="Utility program for Xenoblade Chronicles X to search for optimal data probe configuration"
arch=('x86_64')
url="https://github.com/minneyar/xenoprobes"
license=('GPL-3.0-or-later')
depends=('fmt' 'gcc-libs' 'spdlog' 'glibc' 'qt6-base' 'qt6-svg')
makedepends=('git' 'cmake' 'ninja' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -B build -D CMAKE_INSTALL_PREFIX=/usr -G Ninja -W no-dev
	cmake --build build/
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" cmake --install build
}
