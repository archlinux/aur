# Maintainer:Antonio Rojas <arojas@archlinux.org>

pkgname=wacomtablet
pkgver=6.4.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='GUI for Wacom Linux drivers that supports different button/pen layout profiles'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         kglobalaccel
         ki18n
         kio
         kirigami
         knotifications
         kservice
         ksvg
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libwacom
         libxcb
         libxi
         libplasma
         plasma5support
         qt6-base
         qt6-declarative
         xf86-input-wacom)
makedepends=(extra-cmake-modules
             kdoctools)
conflicts=(kcm-wacomtablet)
replaces=(kcm-wacomtablet)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('353d43f5a9f7ab045c1f018abd54addc638fb094eec5375f1ff6316919033398'
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
