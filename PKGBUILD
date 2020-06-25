# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

_pkgname=plasma-applet-volumewin7mixer
pkgname=plasma5-applets-volumewin7mixer
pkgver=25
pkgrel=1
pkgdesc="A fork of the default volume plasmoid with a Windows 7 theme (vertical sliders)"
arch=('any')
url="https://github.com/Zren/$_pkgname"
license=(GPL)
depends=('plasma-pa' 'qt5-declarative' 'python' 'python2')
makedepends=('extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zren/$_pkgname/archive/v$pkgver.tar.gz"
        'CMakeLists.txt')
sha256sums=('6c30774f812bbc040714b9377e7a9b3bbea276b66ef856f37bfc5f5b4040987d'
            '739432241baaafe87c7c6ee44a2b9b33a0abdf1220576ef253b12c4f8c915871')

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
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
