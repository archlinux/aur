# Merged with official ABS ktexteditor PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=ktexteditor-git
pkgver=6.0.0_r4414.ge6c8d21ed
pkgrel=1
pkgdesc='Advanced embeddable text editor'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(editorconfig-core-c gcc-libs glibc karchive-git kauth-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kguiaddons-git ki18n-git kio-git kitemviews-git kparts-git ktextwidgets-git kwidgetsaddons-git kxmlgui-git qt6-declarative qt6-base qt6-speech sonnet-git syntax-highlighting-git)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
optdepends=('git: git integration')
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
