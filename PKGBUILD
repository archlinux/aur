# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-nano
pkgver=6.3.2
pkgrel=0
pkgdesc="A minimal plasma shell package intended for embedded devices."
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma/plasma-nano"
license=('GPL2')
groups=()
depends=(
  plasma-workspace
  kwindowsystem
  ki18n
  kservice
  kitemmodels
  qt6-svg
)
makedepends=('cmake' 'extra-cmake-modules') 
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('842b478f666dd82517882408688da3d98e25039c74c8af5aaad119a82080917e')

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
 
