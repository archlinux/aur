# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

pkgname=maui-station-git
pkgver=4.0.1.r16.g3cc9b06
pkgrel=1
pkgdesc="Convergent terminal emulator"
url="https://invent.kde.org/maui/station"
arch=(x86_64 i686 armv7h aarch64)
license=(GPL-3.0-or-later)
depends=(kconfig
         kcoreaddons
         ki18n
         mauikit-filebrowsing-git
         mauikit-terminal-git
         qt6-base
         qt6-declarative)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=(maui-station)
conflicts=(maui-station)
source=(git+https://invent.kde.org/maui/station.git)
sha256sums=('SKIP')

pkgver() {
  cd "station"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "station" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
