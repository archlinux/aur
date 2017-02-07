# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas

_pkgname=powerdevil
pkgname=powerdevil-light
pkgver=5.9.1
pkgrel=1
pkgdesc="Manages the power consumption settings of a Plasma Shell. Light version without NetworkManager and Bluez support/dependencies."
arch=('i686' 'x86_64')
url="https://www.kde.org/workspaces/plasmadesktop/"
license=('LGPL')
depends=('plasma-workspace' 'libkscreen')
makedepends=('extra-cmake-modules' 'kdoctools' 'python' 'kdesignerplugin')
conflicts=('powerdevil')
provides=('powerdevil')
source=("http://download.kde.org/stable/plasma/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('46247fa4f55249bf996768b611fc9c8b384ec2cf52f37743938319baa703fbad' 'SKIP')
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
        -DKF5NetworkManagerQt_FOUND=OFF \
        -DKF5BluezQt_FOUND=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_LIBEXECDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
