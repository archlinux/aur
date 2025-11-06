# Maintainer: Kelvie Wong <kelvie@kelvie.ca>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

_pkgname=kdeconnect
pkgname=kdeconnect-no-mdns
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=25.08.3
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone. Version without MDNS support, for KDE bug 487719.'
url='https://kdeconnect.kde.org/'
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(dbus
         gcc-libs
         glibc
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kitemmodels
         kjobwidgets
         knotifications
         kpeople
         kservice
         kstatusnotifieritem
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
         qt6-connectivity
         qt6-declarative
         qt6-multimedia
         solid
         wayland)
makedepends=(extra-cmake-modules
             kpackage # kpackage_install_package
             wayland-protocols)
optdepends=('python-nautilus: Nautilus integration'
            'qt6-tools: for some runcommand plugin actions'
            'sshfs: remote filesystem browser')
groups=(kde-applications
        kde-network)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-kde-$pkgver.tar.xz{,.sig})
sha256sums=('6e41f1f22e85f5e70a92dd6ca3e6968364896de37afe5daeb7cda599f03e5e2b'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>


build() {
  cmake -B build -S $_pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DMDNS_ENABLED=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
