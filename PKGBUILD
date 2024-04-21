# Maintainer: Marcel Hasler <mahasler at gmail dot com>
pkgname=kde-cdemu-manager
pkgver=0.9
pkgrel=2
pkgdesc="KDE CDEmu Manager is a simple frontend for CDEmu."
arch=('x86_64')
url="https://github.com/marcelh83/kde-cdemu-manager"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'qt6-base' 'kconfigwidgets' 'kcoreaddons' 'kdbusaddons' 'ki18n' 'knotifications' 'kstatusnotifieritem' 'kwidgetsaddons' 'kxmlgui' 'cdemu-daemon>=2.0')
provides=('kde-cdemu-manager')
conflicts=('kde-cdemu-manager')
makedepends=('cmake' 'extra-cmake-modules')
source=("kde-cdemu-manager-0.9.tar.gz::https://github.com/marcelh83/kde-cdemu-manager/archive/refs/tags/v0.9.tar.gz")
sha256sums=('c9e8f49d4967791c52eeffc0e5f2e4a8d3d176a7bf5f2b6c9469f58de15979ba')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=$(/usr/lib/qt6/bin/qtpaths6 --install-prefix)
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}
