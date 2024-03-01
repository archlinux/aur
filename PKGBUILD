# Merged with official ABS ksshaskpass PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ksshaskpass-git
pkgver=6.0.80_r331.g63ecb6d
pkgrel=1
pkgdesc='ssh-add helper that uses kwallet-git and kpassworddialog'
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc kcoreaddons-git ki18n-git kwallet-git kwidgetsaddons-git qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git} x11-ssh-askpass)
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
