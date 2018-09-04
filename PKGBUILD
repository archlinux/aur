# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=plasma-nm
pkgname=${_pkgname}-light
pkgver=5.13.5
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections – lightweight version without modem and OpenConnect'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(GPL2)
depends=(plasma-workspace networkmanager-qt qca kdeclarative kdelibs4support)
makedepends=(cmake extra-cmake-modules qt5-base qt5-declarative qt5-tools ki18n
kwindowsystem kservice kcompletion kwidgetsaddons kio kcoreaddons kwallet
kitemviews kxmlgui kconfigwidgets kiconthemes solid kdbusaddons knotifications
plasma-framework kinit kdesignerplugin kdoctools)
groups=(plasma)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://download.kde.org/stable/plasma/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('b1762e5927c21ff7604654f59245475fecadfde5d1ab78e11647e5b77c2c0efd' 'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
