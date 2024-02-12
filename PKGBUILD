# Merged with official ABS kauth PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kauth-git
pkgver=6.0.0_r636.gd1db48f
pkgrel=1
pkgdesc='Abstraction to system policy and authentication features'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons-git polkit-qt6-git kwindowsystem-git)
makedepends=(git extra-cmake-modules-git qt6-tools clang python-pyqt6 doxygen sip)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('python-pyqt6: for the Python bindings')
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
