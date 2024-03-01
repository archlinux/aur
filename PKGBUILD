# Merged with official ABS kgamma5 PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kgamma5-git
pkgver=5.27.80_r578.g5f30ea4
pkgrel=1
pkgdesc="Adjust your monitor's gamma settings"
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(gcc-libs glibc kcmutils-git kconfig-git kcoreaddons-git ki18n-git libx11 libxxf86vm qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
