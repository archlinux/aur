# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=5.91.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma applet and services for creating encrypted vaults'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(gcc-libs
         glibc
         plasma-activities
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kservice
         kwidgetsaddons
         libksysguard
         networkmanager-qt
         libplasma
         plasma-workspace
         qt6-base)
makedepends=(extra-cmake-modules)
optdepends=('cryfs: to use cryFS for encryption'
            'encfs: to use encFS for encryption'
            'gocryptfs: to use gocryptfs for encryption')
groups=(plasma)
source=(https://download.kde.org/unstable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('c0d9e65e63e4be5dadb2695a8e3bbb65062824f41861001a67e75d0189b2360e'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
