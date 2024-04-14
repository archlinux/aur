# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=maui-pix-git
pkgver=3.1.0.r6.g5b6fd4a
pkgrel=1
pkgdesc='Image gallery for Maui'
arch=(x86_64)
url="https://github.com/mauikit/pix"
license=(BSD GPL3 LGPL2.0)
groups=(maui)
depends=(mauikit mauikit-imagetools mauikit-filebrowsing

         # namcap implicit depends
         glibc gcc-libs qt5-base qt5-declarative ki18n5 kcoreaddons5 hicolor-icon-theme)
makedepends=(git cmake extra-cmake-modules)
provides=(maui-pix)
conflicts=(maui-pix)
source=("git+https://invent.kde.org/kde/maui-pix.git")
sha256sums=('SKIP')

pkgver() {
  cd "maui-pix"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "maui-pix" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  cd "maui-pix"
  install -D LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
