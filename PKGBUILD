# Maintainer: tristanrw

_pkgname=discover
pkgname=discover-snap-6
pkgver=6.1.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI (with snap backend enabled)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
conflicts=(discover)
provides=(discover)
depends=(appstream-qt
         archlinux-appstream-data
         attica
         discount
         gcc-libs
         glib2
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kiconthemes
         kidletime
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knewstuff
         knotifications
         kservice
         kstatusnotifieritem
         kuserfeedback
         kwidgetsaddons
         kwindowsystem
         purpose
         qcoro-qt6
         qt6-base
         qt6-declarative
         qt6-webview
         snapd
         snapd-glib)
makedepends=(extra-cmake-modules
             flatpak
             fwupd
             packagekit-qt6)
optdepends=('flatpak: Flatpak packages support'
            'fwupd: firmware update support'
            'packagekit-qt6: to manage packages from Arch Linux repositories (not recommended, use at your own risk)')
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('64e73e990bebe13a2614245f03beb51c5027c285fc793309a2cff79e6156d284'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_SnapBackend=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
