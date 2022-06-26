# Maintainer: catsout <outline941 at live.com>

pkgname=wallpaper-engine-kde-plugin-git
pkgver=0.5.3.r1.geca8c2b
pkgrel=1
pkgdesc="A kde wallpaper plugin integrating wallpaper engine."
arch=("x86_64")
url=https://github.com/catsout/wallpaper-engine-kde-plugin
license=("GPL2")
depends=(
    "plasma-framework" "gst-libav" "mpv" "python-websockets" "qt5-declarative" 
    "qt5-websockets" "qt5-webchannel" "vulkan-driver"
)
makedepends=(
    "vulkan-headers" "extra-cmake-modules" "git"
)
provides=("wallpaper-engine-kde-plugin")
conflicts=("wallpaper-engine-kde-plugin")
source=("git+${url}")
sha256sums=('SKIP')

prepare(){
    cd "${srcdir}/wallpaper-engine-kde-plugin"
    git submodule update --init
}
pkgver(){
    cd "${srcdir}/wallpaper-engine-kde-plugin"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/wallpaper-engine-kde-plugin"
    mkdir build
    cd build
    cmake .. \
        -DUSE_PLASMAPKG=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        --install-prefix=/usr
    make
}
package(){
    cd "${srcdir}/wallpaper-engine-kde-plugin"
    cd build
    make install DESTDIR="${pkgdir}"
}
