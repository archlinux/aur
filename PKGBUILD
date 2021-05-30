# Merged with official ABS polkit-kde-agent PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=polkit-kde-agent-git
pkgver=5.22.80_r497.gaa6f7c5
pkgrel=1
pkgdesc='Daemon providing a polkit authentication UI for KDE'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kiconthemes-git kdbusaddons-git kcrash-git)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git} polkit-kde-git)
provides=(${pkgname%-git})
replaces=(polkit-kde-git)
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}-1.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}-1
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git}-1 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
