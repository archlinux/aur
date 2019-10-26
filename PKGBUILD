pkgname=openxray-git-current
pkgver=1.6.02_$(git ls-remote https://github.com/OpenXRay/xray-16.git | head -n1 | grep -Po "^.{7}")
pkgrel=1
provides=('openxray')
conflicts=('openxray' 'openxray-bin' 'openxray-git')
pkgdesc="Unofficial X-Ray Engine Linux port by OpenXRay team (Originally developed by GSC Game World)"
arch=('any')
makedepends=(gcc git cmake libglvnd libjpeg6-turbo ncurses pcre2 pcre)
depends=(glew sdl2 openal intel-tbb crypto++ liblockfile freeimage libogg libtheora libvorbis lzo lzop libjpeg-turbo)
url="https://github.com/OpenXRay/xray-16"
license=('GPL3')
source=(
    'git+https://github.com/OpenXRay/xray-16.git'
)
sha256sums=(
    'SKIP'
)

package() {
    cd xray-16
    git submodule update --init --recursive
    mkdir bin
    cd bin
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j$(nproc --all)
    make DESTDIR="$pkgdir" install
    mv "$pkgdir/usr/games" "$pkgdir/usr/bin"
}
