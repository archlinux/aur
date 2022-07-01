# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-nano
pkgver=5.25.2
pkgrel=1
pkgdesc="A minimal plasma shell package intended for embedded devices."
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma/plasma-nano"
license=('GPL2')
groups=()
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules') 
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('7301895469b13f5c4f6287f40f7f5ecb44d83380ec9e06eb9421192f9765d0af')

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
 
