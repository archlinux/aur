# Maintainer: LambdAurora <aurora42lambda@gmail.com>
pkgname=lambdacommon-git
pkgver=20190424
pkgrel=1
pkgdesc="A library written in C++ with common features."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://aperlambda.github.io/libraries/lambdacommon/"
license=('MIT')
makedepends=('cmake' 'git')
provides=('lambdacommon')
conflicts=('lambdacommon')
options=()
install=
source=('lambdacommon::git+https://github.com/AperLambda/lambdacommon')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    git submodule update --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake .\
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build .
}

check() {
	cd "$srcdir/${pkgname%-git}"
	#./tests/lambdacommon_test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
	make DESTDIR="$pkgdir/" install
}

