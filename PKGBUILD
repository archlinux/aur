# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkgname=plasma-integration
pkgname=${_pkgname}-light
pkgver=5.11.0
pkgrel=1
pkgdesc="Qt Platform Theme integration plugins for the Plasma workspaces without font dependencies"
arch=('i686' 'x86_64')
url="https://www.kde.org/workspaces/plasmadesktop/"
license=('LGPL')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('kio' 'kwayland' 'libxcursor' 'qqc2-desktop-style')
makedepends=('extra-cmake-modules' 'python' 'breeze')
groups=('plasma')
source=("https://download.kde.org/stable/plasma/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('e010989088feefe26240036edbe423be0e16622b402720c26a0d3d0c4ade32c3' 'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_DISABLE_FIND_PACKAGE_FontNotoSans=true \
        -DCMAKE_DISABLE_FIND_PACKAGE_FontHack=true \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
