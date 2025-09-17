# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kscreen-display-presets
pkgver=6.4.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='KDE screen management software with display presets support'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kirigami
         kitemmodels
         ksvg
         kwindowsystem
         layer-shell-qt
         libkscreen
         libx11
         libxcb
         libxi
         libplasma
         plasma5support
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             wayland-protocols)
groups=(plasma)
provides=(kscreen)
conflicts=(kscreen)
replaces=(kscreen)
source=(https://download.kde.org/stable/plasma/$_dirver/kscreen-$pkgver.tar.xz{,.sig}
        display-presets.patch)
sha256sums=('b92bde8238b1e7f3d6521cc4b1ba8bba60047a64fff129b2011dff5ff3431037'
            'SKIP'
            '841dc84c5a8e27a6a77c681d4b61e83ac12ab4d959a66329f767f662c9874bd8')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd kscreen-$pkgver
  patch -p1 -i ../display-presets.patch
}

build() {
  cmake -B build  -S kscreen-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
