#Maintainer: lubosz <lubosz@gmail.com>

pkgname=nestk-git
pkgver=ece0f7b
pkgrel=1
pkgdesc="C++ Library for Kinect. Core library used by RGBDemo to process Kinect data."
arch=(i686 x86_64)
url="https://github.com/nburrus/nestk"
license=('GPL')
depends=('opencv' 'eigen3' 'glew')
makedepends=('git')
conflicts=()
options=(makeflags !emptydirs)
source=("git://github.com/rgbdemo/nestk.git")
_gitname="nestk"

sha256sums=("SKIP")

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    
    cmake ../${_gitname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DNESTK_USE_EMBEDDED_EIGEN=0 \
		-DNESTK_USE_EMBEDDED_GLEW=0
   
   make || return 1

}

package() {
    cd $_gitname
    
    make DESTDIR=$pkgdir install || return 1
}
