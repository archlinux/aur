# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mauikit-git
pkgver=4.0.0.r5.g55676c73
pkgrel=2
pkgdesc='Utilities and "templated" controls based on Kirigami and QCC2 that follow the ongoing work on the Maui HIG'
arch=(x86_64 i686 armv7h aarch64)
url="https://mauikit.org/"
license=(LGPL-3.0-only)
groups=(maui)
depends=(glibc gcc-libs qt6-base qt6-5compat qt6-declarative knotifications ki18n mauiman-git
         qt6-multimedia kirigami kcoreaddons purpose kwindowsystem)
makedepends=(git cmake extra-cmake-modules qt6-webengine appstream syntax-highlighting)
provides=(mauikit)
conflicts=(mauikit)
source=("git+https://invent.kde.org/kde/mauikit.git")
sha256sums=('SKIP')

pkgver() {
  cd "mauikit"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "mauikit" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
