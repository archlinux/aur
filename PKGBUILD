# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=plasma6-runners-markdown-bookmarks-git
pkgver=0.5.1.r6.g625d5d5
pkgrel=1
pkgdesc="A Krunner plugin to open web links listed in a Markdown file"
arch=('x86_64')
url=https://github.com/andrewrabert/krunner-markdown-bookmarks
license=('GPL-3.0-only')
depends=(krunner yaml-cpp)
makedepends=(cmake extra-cmake-modules git ninja kcmutils)
provides=(plasma6-runners-markdown-bookmarks)
conflicts=(plasma6-runners-markdown-bookmarks)
source=("git+${url}.git")
sha256sums=('SKIP')
install=plasma6-runners-markdown-bookmarks-git.install

pkgver() {
	cd krunner-markdown-bookmarks
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake \
		-B build \
		-G Ninja \
		-S krunner-markdown-bookmarks \
		-Wno-dev \
		-DCMAKE_SKIP_RPATH=YES \
		-DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
