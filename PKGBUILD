# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-login-manager
pkgver=6.6.1
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
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
         qt6-5compat
         qt6-base
         qt6-declarative
         sh
         systemd-libs)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('af7f911139a8ae4cd5e32800facb412f3ddda6dbd9d0fa27a3f4c6a6f98d6f39'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
