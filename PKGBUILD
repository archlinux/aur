pkgname=openxray-git
_commit=0117cf5
pkgver=1.6.02_$_commit 
pkgrel=1 
pkgdesc="Unofficial X-Ray Engine Linux port by OpenXRay team (Originally developed by GSC Game World)"                                          
arch=('x86_64') 
url="https://github.com/OpenXRay/xray-16"
license=('unknown')
install="info.install"
makedepends=(gcc cmake glew libglvnd openal pugixml intel-tbb crypto++ liblockfile freeimage freeimage libogg libtheora libvorbis lzo lzop libjpeg-turbo libjpeg6-turbo ncurses pcre2 pcre sdl2)
depends=(glew sdl2 openal intel-tbb crypto++ liblockfile freeimage freeimage lua51 libogg libtheora libvorbis lzo lzop libjpeg-turbo)  
source=(xray-16::git+https://github.com/OpenXRay/xray-16.git#commit=$_commit)
md5sums=('SKIP')

prepare(){
cd "$srcdir/xray-16"
git submodule init
git submodule update
}

build() {
   cd "$srcdir/xray-16"
   rm -fr build
   mkdir "$srcdir/xray-16/build"
   cd "$srcdir/xray-16/build"
   cmake ..
   #cmake .. -DCMAKE_BUILD_TYPE=Debug
   make -j$(nproc)
}

package() {
    cd "$srcdir/xray-16/build"
    make DESTDIR="$pkgdir/" install
    mv $pkgdir/usr/games/ $pkgdir/usr/bin
}
