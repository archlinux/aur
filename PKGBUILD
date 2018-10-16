# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

_pkgname=plasma-applet-volumewin7mixer
pkgname=plasma5-applets-volumewin7mixer
pkgver=23
pkgrel=1
pkgdesc="A fork of the default volume plasmoid with a Windows 7 theme (vertical sliders)"
arch=('any')
url="https://github.com/Zren/$_pkgname"
license=(GPL)
depends=('plasma-pa' 'qt5-declarative' 'python2')
makedepends=('extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zren/$_pkgname/archive/v$pkgver.tar.gz"
        'CMakeLists.txt')
sha256sums=('8f9430d9b8c4050a221f1ba2ae7cc557ccf5e4697366e6794d7024baf83a9ed0'
            'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"
    cp "$srcdir"/CMakeLists.txt .
    rm -rf build
    mkdir -p build
}

build() {
    cd "$_pkgname-$pkgver"/build
    cmake .. \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    cd "$_pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
