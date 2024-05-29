# Maintainer: Kelvie Wong <kelvie@kelvie.ca>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

_pkgname=kdeconnect
pkgname=kdeconnect-no-mdns
provides=($_pkgname)
pkgver=24.05.0
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://kdeconnect.kde.org/'
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(dbus
         gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         kdeclarative
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knotifications
         kpeople
         kservice
         kstatusnotifieritem
         kwidgetsaddons
         kwindowsystem
         libfakekey
         libx11
         libxkbcommon
         libxtst
         modemmanager-qt
         openssl
         pulseaudio-qt
         qqc2-desktop-style
         qt6-base
#        qt6-connectivity
         qt6-declarative
         qt6-multimedia
         qt6-wayland
         solid
         wayland)
makedepends=(extra-cmake-modules
             kdoctools
             kpackage # kpackage_install_package
             wayland-protocols)
optdepends=('python-nautilus: Nautilus integration'
            'qt6-tools: for some runcommand plugin actions'
            'sshfs: remote filesystem browser')
groups=(kde-applications
        kde-network)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-kde-$pkgver.tar.xz)
sha256sums=('b05f5ee164160a7ffaa1269a27fd2a55006dd009f66c6bf10530bce2d9d980cd')

build() {
  cmake -B build -S $_pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DMDNS_ENABLED=OFF \
    -DBLUETOOTH_ENABLED=OFF # https://bugs.kde.org/show_bug.cgi?id=481870
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
