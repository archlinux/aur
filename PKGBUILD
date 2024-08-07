# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=6.1.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma applet and services for creating encrypted vaults'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         plasma-activities
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kitemmodels
         kservice
         kwidgetsaddons
         libksysguard
         networkmanager-qt
         libplasma
         plasma-workspace
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
optdepends=('cryfs: to use cryFS for encryption'
            'encfs: to use encFS for encryption'
            'gocryptfs: to use gocryptfs for encryption')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('34a4ff4c5b9bf6fe75c4eab0225daea21c25129179defc89b0b92ecb1a7bc8df'
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
