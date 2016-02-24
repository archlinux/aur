# Maintainer: i@jingbei.li
pkgname=cudaminer-git
_gitname=CudaMiner
pkgver=209.746a773
pkgrel=1
pkgdesc="CUDA accelerated mining application for scrypt coins(Litecoin etc.)."
url="https://github.com/cbuchner1/CudaMiner"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cuda' 'automake' 'jansson')
makedepends=('git')
source=("git+https://github.com/cbuchner1/CudaMiner")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
	cd $_gitname
	sed "s/\-arch=compute_10 //g" -i Makefile.am
	./autogen.sh
	CFLAGS=-O2 ./configure --with-cuda=/opt/cuda  --prefix=/usr
	make -j32
}

package() {
	cd $_gitname
	make DESTDIR=${pkgdir} install
}
