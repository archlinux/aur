# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=kdeconnect
pkgver=24.01.75
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
url='https://kdeconnect.kde.org/'
arch=(x86_64)
license=(GPL)
depends=(dbus
         gcc-libs
         glibc
         kcmutils5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kdbusaddons5
         kguiaddons5
         ki18n5
         kiconthemes5
         kio5
         kirigami-addons5
         knotifications5
         kpeople5
         kpeoplevcard
         kservice5
         kwidgetsaddons5
         kwindowsystem5
         libfakekey
         libx11
         libxkbcommon
         libxtst
         modemmanager-qt5
         openssl
         pulseaudio-qt
         qqc2-desktop-style5
         qt5-base
         qt5-declarative
         qt5-multimedia
         qt5-quickcontrols2
         qt5-wayland
         qt5-x11extras
         solid5
         wayland)
makedepends=(extra-cmake-modules
             kdoctools5
             wayland-protocols)
optdepends=('python-nautilus: Nautilus integration'
            'qt5-tools: for some runcommand plugin actions'
            'sshfs: remote filesystem browser')
groups=(kde-applications
        kde-network)
source=(https://download.kde.org/unstable/release-service/$pkgver/src/$pkgname-kde-$pkgver.tar.xz{,.sig})
sha256sums=('1944f105dd4f9d814e74ef194e2935ba63d7a894432afcb19f20b3bbb71194ad'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
