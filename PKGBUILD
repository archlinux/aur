# Merged with official ABS akregator PKGBUILD by João, 2021/07/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=akregator-git
pkgver=24.04.40_r7006.gb717d382
pkgrel=1
pkgdesc="A Feed Reader by KDE"
arch=($CARCH)
url="https://kontact.kde.org"
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc grantleetheme-git kcmutils-git kcodecs-git kcolorscheme-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git ki18n-git kio-git knotifications-git knotifyconfig-git kontactinterface-git kparts-git kstatusnotifieritem-git ktextaddons-git ktextwidgets-git kuserfeedback-git kwidgetsaddons-git kxmlgui-git libkdepim-git messagelib-git pimcommon-git qt6-base qt6-webengine syndication-git)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=('kdepim-addons-git: additional plugins')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  _ver=${_ver:-"$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"}
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
