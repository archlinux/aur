# Merged with official ABS plasma-integration PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=plasma-integration-git
pkgver=5.22.80_r517.ged1c2fa
pkgrel=1
pkgdesc="Qt Platform Theme integration plugins for the Plasma workspaces"
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kio-git kwayland-git libxcursor noto-fonts ttf-hack qqc2-desktop-style-git perl)
makedepends=(git extra-cmake-modules-git breeze-git)
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
