# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=elisa-git
pkgver=24.01.90.r369.g0abb9afe
pkgrel=1
pkgdesc="Simple music player aiming to provide a nice experience for its users"
url='https://apps.kde.org/elisa/'
arch=(x86_64)
license=(LGPL-3.0-or-later)
depends=(gcc-libs
         glibc
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kitemviews
         kxmlgui
         qqc2-desktop-style
         qt6-base
         qt6-declarative
         qt6-multimedia
         vlc)
makedepends=(extra-cmake-modules git kdoctools python)
provides=(elisa)
conflicts=(elisa)
source=("git+https://invent.kde.org/multimedia/elisa.git")
sha512sums=('SKIP')

pkgver() {
  cd elisa
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S elisa \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
