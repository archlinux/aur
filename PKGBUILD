# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

_pkgname=plasma-applet-todolist
pkgname=plasma5-applets-todolist
pkgver=10
pkgrel=1
pkgdesc="Extension of the kdeplasma-applets notes widget, where it's organized as a list"
url="https://github.com/Zren/$_pkgname"
license=(GPL)
depends=('plasma-workspace' 'qt5-declarative')
makedepends=('extra-cmake-modules')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zren/$_pkgname/archive/v$pkgver.tar.gz"
        'CMakeLists.txt')
sha256sums=('18de971a04eb29ad1d5052da054181791811e7784823f654ac96e3b3e643c8fc'
            '94af6eb61a665717e30a8a58d5609dc631149cd5a44d7c3f5f059503bca5b6e9')

prepare() {
    cp "$srcdir"/CMakeLists.txt "$_pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd build
    cmake ../"$_pkgname-$pkgver" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
