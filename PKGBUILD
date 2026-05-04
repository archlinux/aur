# Merged with official ABS kguiaddons PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kguiaddons-git
pkgver=6.27.0_r761.g6b5fdeb
pkgrel=1
pkgdesc='Addons to QtGui'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc libx11 qt6-base wayland)
makedepends=(git doxygen extra-cmake-modules-git plasma-wayland-protocols-git pyside6 python-build python-setuptools qt6-declarative qt6-tools wayland-protocols)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('pyside6: Python bindings'
            'qt6-declarative: QML bindings')
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
