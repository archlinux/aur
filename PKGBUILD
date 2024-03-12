# Maintainer: Melanie Scheirer <mel@nie.rs>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=purpose-git
_name=${pkgname/-git}
pkgver=r1238.ef7dace8
pkgrel=1
pkgdesc="Framework for providing abstractions to get the developer's purposes fulfilled"
arch=(x86_64)
url='https://projects.kde.org/projects/playground/libs/purpose'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(accounts-qml-module
         gcc-libs
         glibc
         kaccounts-integration
         kcmutils
         kconfig
         kcoreaddons
         ki18n
         kio
         kirigami
         knotifications
         kservice
         libaccounts-qt
         qt6-base
         qt6-declarative
)
makedepends=(extra-cmake-modules git python intltool kdeclarative qt6-multimedia prison)
optdepends=('bluez-qt: sharing via Bluetooth'
            'kdeclarative: Nextcloud and YouTube plugins'
            'kdeconnect: sharing to smartphone via KDE Connect'
            'prison: QR code plugin'
            'telegram-desktop: sharing via Telegram')
provides=(purpose)
conflicts=(purpose)
source=("git+https://github.com/KDE/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_name -DCMAKE_INSTALL_LIBEXECDIR=lib -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
