# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-login-manager
pkgver=6.4.git20250712
pkgrel=1
_commit=3093e54e96eee5fcf9102825429ad39fb4a47d7a
arch=(x86_64)
pkgdesc='Plasma Login Manager'
url='https://kde.org/es/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kauth
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kpackage
         kservice
         kwindowsystem
         layer-shell-qt
         libplasma
         libxau
         pam
         plasma-workspace
         qt6-base
         qt6-declarative
         sh
         systemd-libs)
makedepends=(extra-cmake-modules
             git
             qt6-tools)
source=(git+https://invent.kde.org/plasma/plasma-login-manager#commit=$_commit)
sha256sums=('1ee4848c44ec665f24d32b5cdb8dd586606cbcfe3fd8089c8dfb1687ccb91a63')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf \
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
