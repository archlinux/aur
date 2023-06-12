
pkgname=kcolorscheme-git
pkgver=5.240.0_r121.g1fba09a
pkgrel=1
pkgdesc='Classes to read and interact with KColorScheme'
arch=($CARCH)
url='https://invent.kde.org/frameworks/kcolorscheme'
license=(LGPL)
depends=(kconfig-git kguiaddons-git ki18n-git)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf6-git)
source=("git+https://invent.kde.org/frameworks/kcolorscheme.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
