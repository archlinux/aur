# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=fleng
pkgver=16
pkgrel=1
pkgdesc="A low level concurrent logic programming language descended from Prolog"
arch=('x86_64')
url="http://www.call-with-current-continuation.org/fleng/fleng.html"
license=("Public Domain")
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('gcc' 'make')
source=(http://www.call-with-current-continuation.org/fleng/fleng-${pkgver}.tgz 'fix-build.patch')
sha256sums=('4f31ced9b467bb2b148405906d4f991b41cebcb5b232c1c00709b741bd99ff70'
	    '1029d18b00430b6f39667f79bec7f898fd4dd29e17121b7e5f35f8d2510ab0fe')
internal="0f94347398"

build() {
    cd $srcdir/fleng-$pkgver-$internal
    patch -u < "${srcdir}/fix-build.patch"
    ./configure
    make
}

check() {
    cd $srcdir/fleng-$pkgver-$internal
    make check
}

package() {
    cd $srcdir/fleng-$pkgver-$internal
    make DESTDIR=$pkgdir install
}
