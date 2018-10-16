# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

_pkgname=plasma-applet-todolist
pkgname=plasma5-applets-todolist
pkgver=7
pkgrel=1
pkgdesc="Extension of the kdeplasma-applets notes widget, where it's organized as a list"
url="https://github.com/Zren/$_pkgname"
license=(GPL)
depends=('plasma-workspace' 'qt5-declarative')
makedepends=('extra-cmake-modules')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zren/$_pkgname/archive/v$pkgver.tar.gz"
        'CMakeLists.txt')
sha256sums=('e064a4aebd1eca2444b0178b19b55890f6e5eda7dabf55cc4ef099fdc4c0d0e7'
            'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"/todolist
    cp "$srcdir"/CMakeLists.txt .
    rm -rf build
    mkdir -p build
}

build() {
    cd "$_pkgname-$pkgver"/todolist/build
    cmake .. \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    cd "$_pkgname-$pkgver"/todolist/build
    make DESTDIR="$pkgdir" install
}
