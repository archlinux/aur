pkgname=plasma5-applets-caraoke-git
pkgver=r23.15e2712
pkgrel=1
pkgdesc="kde widget for representation of karaoke styled lyrics."
arch=("x86_64")
url="https://github.com/Copay/caraoke-plasmoid"
license=("LGPL")
depends=("plasma-workspace")
makedepends=("git" "extra-cmake-modules" "cmake" "make")
provides=("plasma5-applets-caraoke")
conflicts=("plasma5-applets-caraoke")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "$srcdir/caraoke-plasmoid"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
build(){
    cd "$srcdir/caraoke-plasmoid"
    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="$(qtpaths --install-prefix)" ..
    make
}
package(){
    cd "$srcdir/caraoke-plasmoid/build"
    DESTDIR="$pkgdir" make install
}
