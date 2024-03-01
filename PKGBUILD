# Merged with official ABS libkdegames PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=libkdegames-git
pkgver=24.01.90_r2477.gfa095b60
pkgrel=1
pkgdesc='Common code and data for many KDE games'
url='https://www.kde.org/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc karchive-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kdnssd-git kguiaddons-git ki18n-git knewstuff-git kwidgetsaddons-git kxmlgui-git libsndfile openal qt6-base qt6-declarative qt6-svg)
makedepends=(git extra-cmake-modules-git)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
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
