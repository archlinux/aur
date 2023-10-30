#Maintainer: Sebastian "muxelplexer" Muxel <sebastian@muxel.dev>

pkgname=termnote-git
makedepends=("git" "cmake")
pkgrel=1
pkgver=2.0.0.r10.c93c6b4
pkgdesc="Terminal Notes Application"
arch=(x86_64)
url="https://github.com/muxelplexer/termNote"
license=(MIT)
provides=(termNote)
conflicts=(termNote)
source=("termnote::git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init
	./ext/vcpkg/bootstrap-vcpkg.sh
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-s" CMakeLists.txt
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
