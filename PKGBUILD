# Merged with official ABS libplasma PKGBUILD by João, 2024/03/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=libplasma-git
pkgver=6.0.2_r17313.g8504ae26b
pkgrel=3
pkgdesc='Plasma library and runtime components'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc plasma-activities-git kcmutils-git kcolorscheme-git kconfig-git kcoreaddons-git kglobalaccel-git ki18n-git kiconthemes-git kio-git kirigami-git knotifications-git kpackage-git ksvg-git kwidgetsaddons-git kwindowsystem-git libgl libx11 libxcb qt6-5compat qt6-base qt6-declarative qt6-wayland wayland)
makedepends=(git doxygen extra-cmake-modules-git kdoctools-git plasma-wayland-protocols-git qt6-doc qt6-tools)
conflicts=(${pkgname%-git} plasma-framework plasma-framework-git)
provides=(${pkgname%-git})
replaces=(plasma-framework-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git tag | tail -1 | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build  -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
