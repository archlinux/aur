# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mauikit-git
pkgver=3.1.0.r8.gb2984f59
pkgrel=1
pkgdesc='Utilities and "templated" controls based on Kirigami and QCC2 that follow the ongoing work on the Maui HIG'
arch=(x86_64 i686 armv7h aarch64)
url="https://mauikit.org/"
license=(LGPL3)
groups=(maui)
depends=(qt6-base qt6-declarative qt6-quickcontrols2 knotifications5 ki18n5 mauiman-git)
makedepends=(git cmake extra-cmake-modules qt6-webengine appstream syntax-highlighting5 plasma-framework5)
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
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
