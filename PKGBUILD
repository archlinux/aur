
pkgname=kglobalacceld-git
pkgver=_r237.g8827cbc
pkgrel=1
pkgdesc='Daemon providing Global Keyboard Shortcut (Accelerator) functionality'
arch=($CARCH)
url='https://invent.kde.org/plasma/kglobalacceld'
license=(LGPL)
depends=(kconfig-git kcoreaddons-git kcrash-git kdbusaddons-git kwindowsystem-git kglobalaccel-git kio-git kservice-git knotifications-git)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf6-git)
source=("git+https://invent.kde.org/plasma/kglobalacceld.git")
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
