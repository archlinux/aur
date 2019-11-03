# Contributor: chip_exe
# https://aur.archlinux.org/packages/openxray-git/
# <openxray@yahoo.com>
pkgname=openxray
_tag=558
pkgver=1.6.02_$_tag
pkgrel=1 
pkgdesc="Unofficial X-Ray Engine Linux port by OpenXRay team (Originally developed by GSC Game World)"                                          
arch=('x86_64') 
url="https://github.com/OpenXRay/xray-16"
license=('custom:Custom 3-сlause BSD')
install="info.install"
makedepends=(gcc git cmake libglvnd libjpeg6-turbo ncurses pcre2 pcre)
depends=(glew sdl2 openal intel-tbb crypto++ liblockfile freeimage libogg libtheora libvorbis lzo lzop libjpeg-turbo)  
conflicts=(openxray-git openxray-dev)
source=(xray-16::git+https://github.com/OpenXRay/xray-16.git#tag=$_tag)
md5sums=('SKIP')

prepare(){
cd "$srcdir/xray-16"
git submodule init
git submodule update
}

build() {
   cd "$srcdir/xray-16"
   rm -fr bin
   mkdir "$srcdir/xray-16/bin"
   cd "$srcdir/xray-16/bin"
   cmake ..
   make
}

package() {
    cd "$srcdir/xray-16/bin"
    make DESTDIR="${pkgdir}/" install
    mv "${pkgdir}/usr/games/" "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/"
    cp "$srcdir/xray-16/License.txt" "${pkgdir}/usr/share/licenses/$pkgname/"
}
