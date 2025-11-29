# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-login-manager
pkgver=6.4.git20251129
pkgrel=1
_commit=146250b351e418ec942f57963cf9829b596329f3
arch=(x86_64)
pkgdesc='Plasma Login Manager'
url='https://kde.org/plasma-desktop/'
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
sha256sums=('828aa95d6029627265d863874934f1b488bc8b80fe8422a27fedcc8fbb512f99')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
