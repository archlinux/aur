# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=24.05.1
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://kdeconnect.kde.org/'
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(dbus
         gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         kdeclarative
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knotifications
         kpeople
         kservice
         kstatusnotifieritem
         kwidgetsaddons
         kwindowsystem
         libfakekey
         libx11
         libxkbcommon
         libxtst
         modemmanager-qt
         openssl
         pulseaudio-qt
         qqc2-desktop-style
         qt6-base
#        qt6-connectivity
         qt6-declarative
         qt6-multimedia
         qt6-wayland
         solid
         wayland)
makedepends=(extra-cmake-modules
             kdoctools
             kpackage # kpackage_install_package
             wayland-protocols)
optdepends=('python-nautilus: Nautilus integration'
            'qt6-tools: for some runcommand plugin actions'
            'sshfs: remote filesystem browser')
groups=(kde-applications
        kde-network)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz{,.sig})
sha256sums=('efdb17b60f531b13cb5222b293349050711a4636282ac3d586da98aa50564780'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBLUETOOTH_ENABLED=OFF # https://bugs.kde.org/show_bug.cgi?id=481870
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
