# Maintainer:  Josh Dye 
# Contributor: Kendell Clark <coffeekingms@gmail.com
# Contributor: Quintus <quintus@quintilianus.eu>
pkgname=tsc-git
pkgver=r1869
pkgrel=1
pkgdesc="Jump'n'run game, fork of SMC"
arch=("i686" "x86_64")
url="https://github.com/Secretchronicles/TSC"
license=('GPL')
depends=("sdl_image" "sdl_ttf" "glew" "sdl_mixer" "devil" "boost-libs" "libxml++" "gettext" "mesa" "freeglut")
makedepends=("cmake" "ruby" "gperf" "pkg-config" "bison" "boost")
optdepends=()
conflicts=("smc" "tsc")
options=()
source=("git+https://github.com/Secretchronicles/TSC.git" "tsc.desktop")
noextract=()
md5sums=("SKIP"
         "b96731e4a6eeee41aa97d6f84c67cabb")

pkgver() {
    cd "$srcdir/TSC"
    echo -n "r"
    git rev-list HEAD --count
}

prepare() {
    cd "$srcdir/TSC"
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/TSC/tsc"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
    make
}

package() {
    cd "$srcdir/TSC/tsc/build"
    make install DESTDIR="$pkgdir/"
}
