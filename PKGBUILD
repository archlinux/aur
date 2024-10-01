# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=maui-pix-git
pkgver=4.0.0.r6.gdb23495
pkgrel=1
pkgdesc='Image gallery for Maui'
arch=(x86_64)
url="https://github.com/mauikit/pix"
license=(BSD-3-Clause GPL-3.0-or-later LGPL-2.0-or-later)
groups=(maui)
depends=(mauikit-git mauikit-imagetools-git mauikit-filebrowsing-git

         # namcap implicit depends
         glibc gcc-libs qt6-base qt6-declarative ki18n kcoreaddons hicolor-icon-theme)
makedepends=(git cmake extra-cmake-modules)
provides=(maui-pix)
conflicts=(maui-pix)
source=("git+https://invent.kde.org/kde/maui-pix.git")
sha256sums=('SKIP')

pkgver() {
  cd "maui-pix"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "maui-pix" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  cd "maui-pix"
  install -D LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
