# Merged with official ABS pimcommon PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=pimcommon-git
pkgver=5.17.40_r1051.g0e243ee
pkgrel=1
pkgdesc="Common libraries for KDE PIM"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL)
depends=(libkdepim-git kpimtextedit-git knewstuff-git kimap-git kldap-git akonadi-contacts-git akonadi-search-git purpose-git)
makedepends=(git extra-cmake-modules-git boost qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
