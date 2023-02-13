# Merged with official ABS kconfigwidgets PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kconfigwidgets-git
pkgver=5.240.0_r864.ge908c257
pkgrel=1
pkgdesc='Widgets for KConfig'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kauth-git kcodecs-git kconfig-git kguiaddons-git ki18n-git kwidgetsaddons-git)
makedepends=(git extra-cmake-modules-git kdoctools-git clang python-pyqt6 doxygen qt6-tools sip4)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('python-pyqt6: for the Python bindings' 'perl: for preparetips5')
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
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
