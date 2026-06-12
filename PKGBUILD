# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-mobile-git
pkgver=6.6.90.r43.g60cfb90
pkgrel=1
pkgdesc="Plasma Mobile shell components"
arch=('any')
url="https://invent.kde.org/plasma/plasma-mobile"
license=('GPL2')
groups=()
depends=(
  plasma-nano-git
  plasma-nm-git
  plasma-pa-git
  bluez-qt
  powerdevil-git
  modemmanager-qt-git
  qqc2-breeze-style-git
  kirigami-addons-git
  maliit-keyboard
  kpipewire-git
  plasma-settings-git
  kwin-git
  plasma-keyboard-git
)
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('plasma-mobile')
source=('git+https://invent.kde.org/plasma/plasma-mobile.git')
noextract=()
md5sums=('SKIP')

pkgver() {
        cd "plasma-mobile"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "plasma-mobile" \
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
