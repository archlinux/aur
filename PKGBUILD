# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kscreen-display-presets
pkgver=6.5.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE screen management software with display presets support'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
provides=(kscreen)
conflicts=(kscreen)
replaces=(kscreen)
depends=(gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kimageformats
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
         wayland)
makedepends=(extra-cmake-modules
             wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/kscreen-$pkgver.tar.xz{,.sig}
        display-presets.patch)
sha256sums=('91eb32f0f7011655aa3972b6c235d068e23afc6ba08af04a31eac992de731d9e'
            'SKIP'
            '48cbb28fdac4509dc6bb7d7abaf2075ed54b5adeade62892be1d2c901673118b')
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
