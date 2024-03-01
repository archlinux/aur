# Merged with official ABS kdav PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=kdav-git
pkgver=6.0.0_r1464.ge2345a9
pkgrel=1
epoch=1
pkgdesc="A DAV protocol implemention with KJobs"
arch=($CARCH)
url="https://community.kde.org/Frameworks"
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc kcoreaddons-git ki18n-git kio-git qt6-base)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
