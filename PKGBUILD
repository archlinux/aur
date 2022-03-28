# Maintainer: heliochronix <heliochronix@gmail.com>

pkgname=gr-satellites-git
pkgver=r1240.2ea3401
pkgrel=1
pkgdesc="gr-satellites decoder blocks for GNURadio"
arch=('x86_64' 'aarch64')
url="https://github.com/daniestevez/gr-satellites"
branch="main"
license=('GPL3')
depends=('gnuradio' 'boost-libs' 'python-construct>=2.9' 'python-requests')
optdepends=('feh: For realtime image decoders'
            'doxygen: For document generation')
makedepends=('git' 'cmake' 'libfec' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git#branch=$branch")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${pkgname%-git}/build"
	cd "$srcdir/${pkgname%-git}/build"

	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
