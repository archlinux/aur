# Maintainer: zanny <lordzanny@gmail.com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-framework-git
_name=${pkgname%-git}
pkgver=r13831.0ffd768
pkgrel=2
pkgdesc='Plasma library and runtime components based upon KF5 and Qt5'
arch=(x86_64)
url='https://projects.kde.org/projects/playground/libs/plasma-framework'
license=(LGPL)
depends=(kactivities-git kparts-git kpackage-git kirigami-git)
makedepends=(extra-cmake-modules-git git qt5-tools kdoctools-git)
conflicts=(plasma-framework)
provides=(plasma-framework)
groups=(kf5)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
