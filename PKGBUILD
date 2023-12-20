# Maintainer:Antonio Rojas <arojas@archlinux.org>

pkgname=wacomtablet
pkgver=5.27.80
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='GUI for Wacom Linux drivers that supports different button/pen layout profiles'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         kglobalaccel
         ki18n
         kio
         knotifications
         kservice
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libwacom
         libxcb
         libxi
         plasma-framework # QML
         plasma5support
         qt6-base
         xf86-input-wacom)
makedepends=(extra-cmake-modules
             kdoctools)
conflicts=(kcm-wacomtablet)
replaces=(kcm-wacomtablet)
groups=(plasma)
source=(https://download.kde.org/unstable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('d8c4638ee07933372d61bb77c93919a96392833dac4202bad78f1cdf04e96b7c'
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
