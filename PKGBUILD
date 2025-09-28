# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-login-manager
pkgver=6.4.git20250928
pkgrel=1
_commit=df6f69ba25a461b731fea74f553e6636184480da
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
source=(git+https://invent.kde.org/plasma/plasma-login-manager#commit=$_commit
        plasmalogin{,-greeter,-autologin})
sha256sums=('4b0fb2e76d8ce5060787a4a091777a697732a0d7dfdda93b6d30139da8b693ce'
            'd7394292a65ae463926c2c3d2cb4e67bbfeb20995450c8e4c92fe5a28e7c4254'
            '3406bce46be8450e28ddbccfbcd0e1f8fa585d57da8833ff7294cf3aee84bb46'
            '1a84cf752782b03b53f66188013bf7e4af4f5e6feb7266bfe58c3faaa20777b4')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 plasmalogin* -t "$pkgdir"/etc/pam.d
}
