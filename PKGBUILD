# Merged with official ABS kcrash PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcrash-git
pkgver=5.79.0_r347.g62e666c
pkgrel=1
pkgdesc='Support for application crash analysis and bug report from apps'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons-git kwindowsystem-git)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools qt5-doc)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('drkonqi-git: KDE crash handler application')
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
