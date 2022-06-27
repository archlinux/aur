# Maintainer: catsout <outline941 at live.com>
# Contributor: Epix <epixtm@protonmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>

pkgname=plasma5-wallpapers-wallpaper-engine-git
pkgver=0.5.3.r1.geca8c2b
pkgrel=1
pkgdesc="A simple kde wallpaper plugin integrating wallpaper engine"
arch=('x86_64')
url="https://github.com/catsout/wallpaper-engine-kde-plugin"
license=('GPL2')
depends=(
    "plasma-framework" "gst-libav" "python-websockets" "qt5-declarative" 
    "qt5-websockets" "qt5-webchannel" "vulkan-driver"
)
makedepends=(
    "vulkan-headers" "extra-cmake-modules" "git" "cmake" "mpv"
)
optdepends=(
	"mpv: alternative video backend"
)
provides=("plasma5-wallpapers-wallpaper-engine")
conflicts=("plasma5-wallpapers-wallpaper-engine")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare(){
    cd "${srcdir}/${pkgname}"
    git submodule update --init
}
pkgver(){
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/${pkgname}"
    cmake -B build . \
        -DCMAKE_BUILD_TYPE=Release \
        --install-prefix=$(kf5-config --prefix)
    cmake --build build
}
package(){
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
}
