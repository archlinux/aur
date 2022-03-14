# Maintainer: subhuman22 <ktmz2@protonmail.com>
pkgname=geogram-git
pkgver=r117.eb6a4483
pkgrel=1
pkgdesc="a programming library with geometric algorithms"
arch=(x86_64)
url="https://github.com/BrunoLevy/geogram"
license=('BSD')
groups=()
depends=('glfw-x11')
makedepends=('git')
provides=("$pkgname" "${pkgname%-git}")
conflicts=("$pkgname" "${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/BrunoLevy/geogram.git' 'CMakeOptions.txt')
noextract=()
md5sums=('SKIP' 'b6d8637ef7b6fdcdf490b4def8b350f9')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp CMakeOptions.txt "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure.sh
    cd "build/Linux64-gcc-dynamic-Release"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    cd "build/Linux64-gcc-dynamic-Release"
	make DESTDIR="$pkgdir/" install
    rm $pkgdir/usr/bin/geogram_demo*
}
