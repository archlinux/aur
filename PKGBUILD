# Merged with official ABS breeze PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-git
pkgver=6.0.80_r2864.gbca12f7a
pkgrel=1
arch=($CARCH)
pkgdesc='Artwork, styles and assets for the Breeze visual style for the Plasma Desktop'
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(breeze-icons-git frameworkintegration-git gcc-libs glibc kcmutils-git kcolorscheme-git kconfig-git kcoreaddons-git kdecoration-git kguiaddons-git ki18n-git kiconthemes-git kirigami-git kwidgetsaddons-git kwindowsystem-git qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules-git frameworkintegration5-git kconfigwidgets5-git kiconthemes5-git kirigami2-git kwindowsystem5-git)
optdepends=('breeze-gtk-git: Breeze widget style for GTK applications')
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
