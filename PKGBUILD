pkgname=plasma6-applets-caraoke-git
pkgver=r24.acdefb5
pkgrel=1
pkgdesc="kde widget for representation of karaoke styled lyrics."
arch=("any")
url="https://github.com/Copay/caraoke-plasmoid"
license=("LGPL-2.1-or-later")
depends=("plasma-workspace" "plasma5support")
makedepends=("git" "extra-cmake-modules" "cmake" "make")
provides=("plasma6-applets-caraoke")
conflicts=("plasma6-applets-caraoke")
source=("git+${url}.git#branch=kde6")
sha256sums=('SKIP')

pkgver(){
    cd "$srcdir/caraoke-plasmoid"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
build(){
    cmake -B build -S "$srcdir/caraoke-plasmoid" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build 
    
}
package(){
    DESTDIR="$pkgdir" cmake --install build
}
