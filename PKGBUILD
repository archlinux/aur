# Merged with official ABS ki18n PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ki18n-git
pkgver=5.79.0_r436.gf88e694
pkgrel=1
pkgdesc='Advanced internationalization framework'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-declarative)
makedepends=(git extra-cmake-modules-git python-pyqt5 clang doxygen qt5-tools qt5-doc sip4)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('python-pyqt5: for the Python bindings' 'python: to compile .ts files')
groups=(kf5-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "set(KF5\?_VERSION" CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
