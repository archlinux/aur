# Maintainer: Sebastian Bøe <sebastianbooe@gmail.com>
pkgname=icestorm-git
pkgver=r63.c6f1e1f
pkgrel=1
pkgdesc="Lattice iCE40 FPGAs Bitstream Documentation (Reverse Engineered)"
arch=('x86_64')
url="http://www.clifford.at/icestorm/"
license=('unknown')
depends=('python' 'libftdi')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cliffordwolf/icestorm.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    make \
        CFLAGS="-MD -O0 -ggdb -Wall -std=c99 -I/usr/include/libftdi1/" \
        LDLIBS="-lftdi1 -lm"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/usr" install
}
