# Maintainer: DetMittens
pkgname=turingcodec-git
_gitname=turingcodec
pkgver=r77.f7138f9
pkgrel=3
pkgdesc="Alternative HEVC codec developed by BBC R&D"
arch=('i686' 'x86_64')
url="http://turingcodec.org/"
license=('GPL2')
makedepends=('cmake')
source=('git+https://github.com/bbc/turingcodec.git')
md5sums=( SKIP )

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir"/codec-build
    cd $srcdir/codec-build
    cmake -G "Unix Makefiles" $srcdir/$_gitname -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

package() {
	cd $srcdir/codec-build
	make DESTDIR="$pkgdir/" install
	install -Dm755 $srcdir/codec-build/turing/turing $pkgdir/usr/bin/turing
}
