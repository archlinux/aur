# Maintainer: gigas002 <gigas002@pm.me>

pkgname=clunk-vangers-git
_pkgname=clunk
pkgver=r148.6d4cbbe
pkgrel=6
pkgdesc="Vangers fork of clunk library"
arch=('x86_64')
url="https://github.com/stalkerg/$_pkgname"
license=('LGPL2.1')
makedepends=('git' 'cmake' 'make' 'sdl2')
provides=("clunk")
conflicts=('clunk' 'libclunk' 'clunk-git' 'libclunk-git' 'clunk-vangers')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_pkgname
    cmake \
        -B build \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    cd $srcdir/$_pkgname

    DESTDIR="$pkgdir" cmake --install build
}
