# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-nano-git
pkgver=6.3.90.r20.ge015e00
pkgrel=1
pkgdesc="A minimal plasma shell package intended for embedded devices"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma/plasma-nano"
license=('GPL2')
groups=()
depends=(
  plasma-workspace-git
  kwindowsystem-git
  ki18n-git
  kservice-git
  kitemmodels-git
  qt6-svg
)
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('plasma-nano')
source=('git+https://invent.kde.org/plasma/plasma-nano.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "plasma-nano"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "plasma-nano" \
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
