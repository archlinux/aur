# Maintainer: gigas002 <gigas002@pm.me>

pkgname=clunk-vangers-git
_pkgname=clunk
pkgver=r148.6d4cbbe
pkgrel=2
pkgdesc="Vangers for of clunk library"
arch=('x86_64')
url="https://github.com/stalkerg/$_pkgname"
license=('LGPL2.1')
makedepends=('git' 'cmake' 'make') # 'sdl2' 'sdl2_net' 'libogg' 'libvorbis' 'ffmpeg')
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
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ . && make
}

package() {
    install -d $pkgdir/usr/lib
    install -d $pkgdir/usr/include/clunk
    cp $srcdir/$_pkgname/lib$_pkgname.so $pkgdir/usr/lib/lib$_pkgname.so
    cp $srcdir/$_pkgname/$_pkgname.h $pkgdir/usr/include/$_pkgname/$_pkgname.h
}
