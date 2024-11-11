pkgname=qtnodes-git
pkgver=3.0.11.r7.gb8ced45
pkgrel=3
pkgdesc="Qt-based library aimed at graph-controlled data processing"
arch=(x86_64)
url="https://github.com/paceholder/nodeeditor"
license=(BSD)
depends=(qt6-base)
makedepends=(cmake)
source=("git+$url.git")
md5sums=('SKIP')

build() {
    cmake -B build -S nodeeditor \
        -DBUILD_TESTING=ON \
        -DBUILD_EXAMPLES=OFF \
        -DCMAKE_BUILD_TYPE=None \
        -DUSE_QT6=on \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -j -C build
}

check() {
    make -C build test
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}

pkgver() {
    cd "$srcdir/nodeeditor"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
} 
