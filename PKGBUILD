# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mauikit-git
pkgver=3.0.1.r64.g277a2870
pkgrel=2
pkgdesc='Utilities and "templated" controls based on Kirigami and QCC2 that follow the ongoing work on the Maui HIG'
arch=(x86_64 i686 armv7h aarch64)
url="https://mauikit.org/"
license=(LGPL3)
groups=(maui)
depends=(qt5-base qt5-declarative qt5-quickcontrols2 knotifications5 ki18n5 mauiman-git)
makedepends=(git cmake extra-cmake-modules qt5-webengine appstream syntax-highlighting5 plasma-framework5)
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
